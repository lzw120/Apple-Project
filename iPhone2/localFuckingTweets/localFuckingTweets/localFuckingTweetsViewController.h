//
//  localFuckingTweetsViewController.h
//  localFuckingTweets
//
//  Created by Michael Thompson on 12/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface localFuckingTweetsViewController : UITableViewController <UITableViewDelegate>{
    NSMutableArray *datasource;
}
@property(nonatomic, retain)NSMutableArray *datasource;
@end
