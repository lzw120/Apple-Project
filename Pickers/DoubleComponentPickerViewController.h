//
//  DoubleComponentPickerViewController.h
//  Pickers
//
//  Created by Zewen Li on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFillingComponent 0
#define kBreadComponent 1

@interface DoubleComponentPickerViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource> {
    UIPickerView *doublePicker;
    NSArray *fillingType;
    NSArray *breadType;
}
@property (nonatomic, retain) IBOutlet UIPickerView *doublePicker;
@property (nonatomic, retain) NSArray *fillingType;
@property (nonatomic, retain) NSArray *breadType;
- (IBAction)buttonPressed:(id)sender;
@end
