//
//  ViewController.m
//  Section
//
//  Created by Zewen Li on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// Bug 1. Two view, just doing all on the second view, but main load the first view....
// Bug 2. while deleting the 1st view, we need set view outlet!, otherwise main do not know what view to load.

#import "ViewController.h"
#import "MutableDeepCopy.h"

@implementation ViewController

@synthesize names;
@synthesize keys;
@synthesize table;
@synthesize search;
@synthesize allNames;
@synthesize isSearching;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Custom Methods
- (void) resetSearch {
    self.names = [self.allNames mutableDeepCopy];
    
    NSMutableArray *keyArray = [[NSMutableArray alloc] init];
    [keyArray addObject:UITableViewIndexSearch];
    [keyArray addObjectsFromArray: [[self.allNames allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    self.keys = keyArray;
}

- (void) handleSearchForTerm:(NSString *)searchTerm {
    NSMutableArray *sectionsToRemove = [[NSMutableArray alloc] init];
    [self resetSearch];
    
    for ( NSString *key  in self.keys) {
        NSMutableArray *array = [names objectForKey:key];
        NSMutableArray *toRemoveArray = [[NSMutableArray alloc] init];
        for (NSString *name in array) {
            if ([name rangeOfString:searchTerm options:NSCaseInsensitiveSearch].location == NSNotFound) {
                [toRemoveArray addObject:name];
            }
        }
        
        if ([toRemoveArray count] == [array count]) {
            [sectionsToRemove addObject:key];
        }
        [array removeObjectsInArray:toRemoveArray];
    }
    [self.keys removeObjectsInArray:sectionsToRemove];
    [table reloadData];
    
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.allNames = dict;
    
    [self resetSearch];
    [table reloadData];
    [table setContentOffset:CGPointMake(0, 44) animated:NO];
//    
//    NSArray *array = [[names allKeys] sortedArrayUsingSelector:@selector(compare:)];
//    self.keys = array;
    

    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.allNames = nil;
    self.table = nil;
    self.search = nil;
    self.keys = nil;
    self.names = nil;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - 
#pragma mark TableView Data Source
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return ([keys count] > 0)? [keys count] : 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([keys count] == 0) {
        return 0;
    }
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    return [nameSection count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    
    static NSString *identifier = @"SectionTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [nameSection objectAtIndex:row];
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([keys count] == 0) {
        return nil;
    }
    
    NSString *key = [keys objectAtIndex:section];
    
    if (key == UITableViewIndexSearch) {
        return nil;
    }
    return key;
}

- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
    NSString *key = [keys objectAtIndex:index];
    if (key == UITableViewIndexSearch) {
        [tableView setContentOffset:CGPointZero animated:NO];
        return NSNotFound;
    }
    else return index;
    
    
}

- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (isSearching) {
        return nil;
    }
    return keys;
}

#pragma mark - TableView Delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText length] == 0) {
        [self resetSearch];
        [table reloadData];
        return;
    }
    [self handleSearchForTerm:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    isSearching = NO;
    searchBar.text = @"";
    [self resetSearch];
    [table reloadData];
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    isSearching = YES;
    [table reloadData];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    isSearching = NO;
    search.text = @"";
    [search resignFirstResponder];
    [tableView reloadData];
    return indexPath;
}


- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    isSearching = NO;
    NSString *searchTerm = [searchBar text];
    [self handleSearchForTerm:searchTerm];
    [searchBar resignFirstResponder];
}


@end
