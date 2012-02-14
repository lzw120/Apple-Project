//
//  CellsViewController.m
//  Cells
//
//  Created by Zewen Li on 1/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CellsViewController.h"


@implementation CellsViewController
@synthesize computers;


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
    NSDictionary *row1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"Macbook", @"Name", @"White", @"Color", nil];
    NSDictionary *row2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"Macbook Pro", @"Name", @"Silver", @"Color", nil];
    NSDictionary *row3 = [[NSDictionary alloc]initWithObjectsAndKeys:@"iMac", @"Name", @"White", @"Color", nil];
    NSDictionary *row4 = [[NSDictionary alloc]initWithObjectsAndKeys:@"Mac mini", @"Name", @"White", @"Color", nil];
    NSDictionary *row5 = [[NSDictionary alloc]initWithObjectsAndKeys:@"Mac Pro", @"Name", @"Silver", @"Color", nil];
    
    NSArray *array = [[NSArray alloc] initWithObjects:row1, row2, row3, row4, row5, nil];
    self.computers = array;
    
    [row1 release];
    [row2 release];
    [row3 release];
    [row4 release];
    [row5 release];
    [array release];
    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.computers = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellTableIdentifier = @"cellTableIdentifier ";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellTableIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellTableIdentifier] autorelease];
        
        CGRect nameLabelRect = CGRectMake(0, 5, 70, 15);
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];
        nameLabel.textAlignment = UITextAlignmentRight;
        nameLabel.text = @"Name:";
        nameLabel.font = [UIFont boldSystemFontOfSize:12];
        [cell.contentView addSubview:nameLabel];
        [nameLabel release];
        
        CGRect colorLabelRect = CGRectMake(0, 26, 70, 15);
        UILabel *colorLabel = [[UILabel alloc] initWithFrame:colorLabelRect];
        colorLabel.textAlignment = UITextAlignmentRight;
        colorLabel.text = @"Color";
        colorLabel.font = [UIFont boldSystemFontOfSize:12];
        [cell.contentView addSubview:colorLabel];
        [colorLabel release];
        
        CGRect nameValueRect = CGRectMake(80, 5, 200, 15);
        UILabel *nameValue = [[UILabel alloc] initWithFrame:nameValueRect];
        nameValue.tag = kNameValueTag;
        [cell.contentView addSubview:nameValue];
        [nameValue release];
        
        CGRect colorValueRect = CGRectMake(80, 25, 200, 15);
        UILabel *colorValue = [[UILabel alloc] initWithFrame:colorValueRect];
        colorValue.tag = kColourValueTag;
        [cell.contentView addSubview:colorValue];
        [colorValue release];
    }
    
    NSUInteger row = [indexPath row];
    NSDictionary *rowData = [self.computers objectAtIndex:row];
    UILabel *name = [(UILabel *) cell.contentView viewWithTag:kNameValueTag];
    name.text = [rowData objectForKey:@"name"];
    UILabel *color = [(UILabel *) cell.contentView viewWithTag:kColourValueTag];
    color.text = [rowData objectForKey:@"color"];
    
    return cell;

    
}


@end
