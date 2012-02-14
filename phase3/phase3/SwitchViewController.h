//
//  SwitchViewController.h
//  phase3
//
//  Created by Zewen Li on 1/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BlueViewController;
@class YellowViewController;

@interface SwitchViewController : UIViewController{
    YellowViewController *yellowViewController;
    BlueViewController *blueViewController;
}
@property (nonatomic, retain)  YellowViewController *yellowViewController;
@property (nonatomic, retain)  BlueViewController *blueViewController;

- (IBAction)switchViews:(id)sender;


@end
