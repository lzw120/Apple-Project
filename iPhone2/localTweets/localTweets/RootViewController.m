//
//  RootViewController.m
//  localTweets
//
//  Created by Michael Thompson on 12/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "TweetData.h"
#import "TweetDataTableCell.h"

@implementation RootViewController
@synthesize datasource;
@synthesize currentLocation;
@synthesize locationManager;
@synthesize locationTimer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateDatasource];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    // location updates once every 30 seconds
    self.locationTimer = [NSTimer scheduledTimerWithTimeInterval:30.0 target:self selector:@selector(updateLocation) userInfo:nil repeats:YES];
    
    self.navigationItem.title = @"Local Tweets";
    
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

- (void)updateDatasource {
    TweetData *data1 = [TweetData tweetDataWithName:@"Bob"
                                            andText:@"Omg"
                                       andAvatarURL:@"http://s3.amazonaws.com/bkite_store/images/user/avatar/61fd6d89a5211dd9951003048c10834/avatar-small.png"];
    TweetData *data2 = [TweetData tweetDataWithName:@"Dan"
                                            andText:@"dude lol"
                                       andAvatarURL:@"http://s3.amazonaws.com/bkite_store/images/user/avatar/61fd6d89a5211dd9951003048c10834/avatar-small.png"];
    TweetData *data3 = [TweetData tweetDataWithName:@"Scott"
                                            andText:@"lmao"
                                       andAvatarURL:@"http://s3.amazonaws.com/bkite_store/images/user/avatar/61fd6d89a5211dd9951003048c10834/avatar-small.png"];
    TweetData *data4 = [TweetData tweetDataWithName:@"Diana"
                                            andText:@"abc123"
                                       andAvatarURL:@"http://s3.amazonaws.com/bkite_store/images/user/avatar/61fd6d89a5211dd9951003048c10834/avatar-small.png"];
    TweetData *data5 = [TweetData tweetDataWithName:@"Jimmy"
                                            andText:@" fjadsfkj alkfda dasf dasf "
                                       andAvatarURL:@"http://s3.amazonaws.com/bkite_store/images/user/avatar/61fd6d89a5211dd9951003048c10834/avatar-small.png"];
    TweetData *data6 = [TweetData tweetDataWithName:@"Laura"
                                            andText:@"<FJ DKSJFL NDKSFN LDNSFJNJ DSLFND"
                                       andAvatarURL:@"http://s3.amazonaws.com/bkite_store/images/user/avatar/61fd6d89a5211dd9951003048c10834/avatar-small.png"];
    self.datasource = [NSMutableArray arrayWithObjects:data1, data2, data3, data4, data5, data6, nil];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TweetDataTableCell";
    
    TweetDataTableCell *cell = (TweetDataTableCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        //cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"TweetDataTableCell"
                                                             owner:nil
                                                           options:nil];
    
    for(id currentObject in topLevelObjects) {
        if([currentObject isKindOfClass:[TweetDataTableCell class]])
        {
            cell = (TweetDataTableCell *)currentObject;
            break;
        }
    }
    
    // Set up the cell...
    TweetData *cellData = [self.datasource objectAtIndex:indexPath.row];
    cell.tweetText.text = cellData.tweetText;
    cell.username.text = cellData.username;
    cell.avatarView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:
                         [NSURL URLWithString:cellData.avatarImageURL]]];
    // TODO: load image asynchronously (LazyTableImages?)
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
    self.datasource = nil;
}

#pragma mark CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"Location found at %f, %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    [locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error in updating location");
}

- (void)updateLocation { [locationManager startUpdatingLocation]; }


@end
