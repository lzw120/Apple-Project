//
//  DatePickerViewController.h
//  Pickers
//
//  Created by Zewen Li on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController {
    UIDatePicker *datePicker;
}
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
- (IBAction)buttonPressed:(id)sender;
@end
