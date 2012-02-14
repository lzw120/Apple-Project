//
//  phase3AppDelegate.h
//  phase3
//
//  Created by Zewen Li on 1/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SwitchViewController;
@interface phase3AppDelegate : NSObject <UIApplicationDelegate>{
    //UIWindow *window;
    SwitchViewController *switchViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SwitchViewController *switchViewController;

@end
