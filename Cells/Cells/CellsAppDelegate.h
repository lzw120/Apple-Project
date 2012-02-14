//
//  CellsAppDelegate.h
//  Cells
//
//  Created by Zewen Li on 1/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellsViewController;

@interface CellsAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CellsViewController *viewController;

@end
