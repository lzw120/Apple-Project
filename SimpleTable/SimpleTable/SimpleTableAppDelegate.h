//
//  SimpleTableAppDelegate.h
//  SimpleTable
//
//  Created by Zewen Li on 1/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleTableViewController;

@interface SimpleTableAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SimpleTableViewController *viewController;

@end
