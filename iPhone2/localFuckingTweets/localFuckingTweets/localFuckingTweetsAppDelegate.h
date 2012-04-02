//
//  localFuckingTweetsAppDelegate.h
//  localFuckingTweets
//
//  Created by Michael Thompson on 12/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class localFuckingTweetsViewController;

@interface localFuckingTweetsAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet localFuckingTweetsViewController *viewController;

@end
