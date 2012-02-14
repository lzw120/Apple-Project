//
//  DependentComponentPickerViewController.h
//  Pickers
//
//  Created by Zewen Li on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kStateComponent 0
#define kZipComponent 1
@interface DependentComponentPickerViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate> {
    UIPickerView *picker;
    NSArray *sates;
    NSArray *zips;
    NSDictionary *stateZips;
}
@property (nonatomic, retain) IBOutlet UIPickerView *picker;
@property (nonatomic, retain) NSArray *states;
@property (nonatomic, retain) NSArray *zips;
@property (nonatomic, retain) NSDictionary *stateZips;
- (IBAction)buttonPressed:(id)sender;

@end
