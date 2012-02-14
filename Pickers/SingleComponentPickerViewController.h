//
//  SingleComponentPickerViewController.h
//  Pickers
//
//  Created by Zewen Li on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleComponentPickerViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource> {
    UIPickerView *SinglePicker;
    NSArray *pickerData;
}
@property (nonatomic, retain) IBOutlet UIPickerView *SinglePicker;
@property (nonatomic, retain) NSArray *pickerData;
- (IBAction)buttonPressed:(id)sender;
@end
