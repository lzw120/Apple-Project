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
@synthesize lattitude;
@synthesize longtitude;

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
    
    NSURL* url = [NSURL URLWithString:@"http://aminby.net"];  
    NSMutableURLRequest* request = [NSMutableURLRequest new];  
    [request setURL:url];  
    [request setHTTPMethod:@"GET"];  
    NSURLRequest* response;  
    NSData* data = [NSURLConnection sendSynchronousRequest:request  
                                         returningResponse:&response error:nil];  
    NSString* strRet = [[NSString alloc] initWithData:data encoding:NSUTF8String];  
     
    
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
    TweetData *data1 = [TweetData tweetDataWithName:@"husein_alicajic"
                                            andText:@"How to guide on Instagram filters and directors signature looks via@braxtonpope  http:\/\/t.co\/kcpcXMlT"
                                       andAvatarURL:@"http://s3.amazonaws.com/bkite_store/images/user/avatar/61fd6d89a5211dd9951003048c10834/avatar-small.png"];
    
    TweetData *data2 = [TweetData tweetDataWithName:@"Dan"
                                            andText:@"#WaysToMyHeart... Be funny. Be dorky. Make me laugh. Take me places. Pay for me &amp; I'll pay for you. watch movies with me. Random Adventures"
                                       andAvatarURL:@"http://a0.twimg.com/profile_images/45764892/Photo_13_normal.jpg"];
    TweetData *data3 = [TweetData tweetDataWithName:@"DiscoverSMCty"
                                            andText:@"RT @Live_SV: #PickOfTheDay: Symphonic Band Concert @csmbulldogs &gt;&gt;http:\/\/t.co\/wtvTVl0p &lt;&lt; STAR WARS music and more! #SiliconValley"
                                       andAvatarURL:@"https://si0.twimg.com/profile_images/452056171/H_normal.jpg"];
    TweetData *data4 = [TweetData tweetDataWithName:@"justinfitch"
                                            andText:@"peardoll your phone software wise is probably just jacked up which happens over time. You just gotta start it over basically."
                                       andAvatarURL:@"http://a0.twimg.com/profile_images/2186407947/Snapshot_20120415_2_normal.JPG"];
    TweetData *data5 = [TweetData tweetDataWithName:@"Elisabeth"
                                            andText:@"At @CA_DMV w\/ 16yo for her driving test. Excited! (She's nervous but won't admit it.)"
                                       andAvatarURL:@"http://a0.twimg.com/profile_images/1853449448/image_normal.jpg"];
    TweetData *data6 = [TweetData tweetDataWithName:@"MontereySeth"
                                            andText:@"Reeling in Eco-Friendly Catch - Canada NewsWire (press release) http:\/\/t.co\/Cm2UGajM #seafoodwatch"
                                       andAvatarURL:@"https://si0.twimg.com/profile_images/1816109942/twitter-dsmc-2_normal.jpg"];
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
    lattitude = nil;
    longtitude = nil;
    self.datasource = nil;
}

#pragma mark CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"Location found at %f, %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    
    NSString *lat = [[NSString alloc] initWithFormat:@"%g", 
                     newLocation.coordinate.latitude];
    lattitude = lat;
    NSString *lng = [[NSString alloc] initWithFormat:@"%g", 
                     newLocation.coordinate.longitude];
    longtitude = lng;
    
    [locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error in updating location");
}

- (void)updateLocation { [locationManager startUpdatingLocation]; }


@end
