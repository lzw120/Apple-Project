//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by Zewen Li on 1/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SimpleTableViewController.h"

@implementation SimpleTableViewController
@synthesize listData;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"Sleepy", @"Sneezy", @"Bashful", @"Happy", @"Doc", @"grumpy", @"Dopey", @"Thorin", @"Dorin", @"Nori", @"Ori", @"Balin", @"Dwalin", @"Fili", @"Kili", @"Oin", @"Gloin", @"Bifur", @"Bofur", @"Bombur", nil];
    self.listData = array;
    [array release];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    self.listData = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier] autorelease];
    }
    UIImage *image = [UIImage imageNamed:@"star.png"];
    cell.imageView.image = image;
    NSInteger row = [indexPath row];
    cell.textLabel.text = [listData objectAtIndex:row];
    if (row < 7) {
        cell.detailTextLabel.text = @"MR Disney";
    }
    else
        cell.detailTextLabel.text = @"Mr Tolkein";
    cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
    return cell;
}

#pragma mark data delegate
// return 'depth' of row for hierarchies
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    return  row;
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    if (row == 0) {
        return nil;
    }
    else
        return indexPath;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    NSString *rowValue = [listData objectAtIndex:row];
    NSString *message = [[NSString alloc] initWithFormat:@"you selected %@",rowValue];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row Selected!" message:message delegate:nil cancelButtonTitle:@"Yes I did" otherButtonTitles: nil];
    [alert show];
    [alert release];
    [message release];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

@end
