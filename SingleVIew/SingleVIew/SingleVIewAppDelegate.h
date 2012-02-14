//
//  SingleVIewAppDelegate.h
//  SingleVIew
//
//  Created by Zewen Li on 2/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SingleVIewViewController;

@interface SingleVIewAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SingleVIewViewController *viewController;

@end
