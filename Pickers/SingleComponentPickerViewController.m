//
//  SingleComponentPickerViewController.m
//  Pickers
//
//  Created by Zewen Li on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@implementation SingleComponentPickerViewController
@synthesize SinglePicker;
@synthesize pickerData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)buttonPressed:(id)sender {
    NSInteger row = [SinglePicker selectedRowInComponent:0];
    NSString *selected = [pickerData objectAtIndex:row]; 
    NSString *msg = [[NSString alloc] initWithFormat:@"you selected %@",selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:msg message:@"thank you for choosing" delegate:nil cancelButtonTitle:@"you are welcome" otherButtonTitles: nil];
    [alert show];
    [alert release];
    [selected release];
    [msg release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *array= [[NSArray alloc] initWithObjects:@"Luke", @"Leia", @"Han", @"Chewbacca", @"Arto", @"Threepio", @"Lando", nil];
    self.pickerData = array;
    [array release];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.pickerData = nil;
    self.SinglePicker = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [pickerData count];
}
#pragma mark Picker Delegate methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [pickerData objectAtIndex:row];
}

@end
