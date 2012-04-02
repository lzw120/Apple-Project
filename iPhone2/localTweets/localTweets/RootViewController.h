//
//  RootViewController.h
//  localTweets
//
//  Created by Michael Thompson on 12/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface RootViewController : UITableViewController <CLLocationManagerDelegate> {
    NSMutableArray *datasource;
}
@property(nonatomic, retain)NSMutableArray *datasource;
@property(nonatomic, retain) CLLocationManager *locationManager;
@property(nonatomic, retain) CLLocation *currentLocation;
@property(nonatomic, retain) NSTimer *locationTimer;

- (void)updateDatasource;

@end
