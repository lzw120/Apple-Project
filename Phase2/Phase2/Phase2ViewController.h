//
//  Phase2ViewController.h
//  Phase2
//
//  Created by Zewen Li on 1/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define degreesToRadians(x) (M_PI * (x)/180.0) 

@interface Phase2ViewController : UIViewController
{
    UIView *portrait;
    UIView *landscape;
    UIButton *landscapefoobutton;
    UIButton *landscapebarbutton;
    UIButton *portraitfoobutton;
    UIButton *portraitbarbutton;
//    UIButton *button5;
//    UIButton *button6;
}

@property (nonatomic, retain) IBOutlet UIButton *landscapefoobutton;
@property (nonatomic, retain) IBOutlet UIButton *landscapebarbutton;
@property (nonatomic, retain) IBOutlet UIButton *portraitfoobutton;
@property (nonatomic, retain) IBOutlet UIButton *portraitbarbutton;
//@property (nonatomic, retain) IBOutlet UIButton *button5;
//@property (nonatomic, retain) IBOutlet UIButton *button6;
- (IBAction)buttonPressed:(id)sender;

@end
