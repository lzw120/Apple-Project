//
//  DoubleComponentPickerViewController.m
//  Pickers
//
//  Created by Zewen Li on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"

@implementation DoubleComponentPickerViewController
@synthesize doublePicker;
@synthesize fillingType;
@synthesize breadType;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)buttonPressed:(id)sender {
    NSInteger breadRow = [self.doublePicker selectedRowInComponent:kBreadComponent];
    NSString *breadMsg = [self.breadType objectAtIndex:breadRow];
    NSInteger fillingRow = [self.doublePicker selectedRowInComponent:kFillingComponent];
    NSString *fillingMsg = [self.fillingType objectAtIndex:fillingRow];
    NSString *msg = [[NSString alloc] initWithFormat:@"Your choice is %@, and %@", fillingMsg, breadMsg];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"thank you for your order" message:msg delegate:nil cancelButtonTitle:@"Yes, I did" otherButtonTitles: nil];
    [alert show];
    [alert release];
    [breadMsg release];
    [fillingMsg release];
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
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"White", @"Whole Wheat", @"Rye", @"Sourdough", @"Seven Grain", nil];
    self.breadType = array1;
    NSArray *array2 = [[NSArray alloc] initWithObjects:@"Ham", @"Turkey", @"Peanut Butter", @"Tuna Salad", @"Chicken Salad", @"Roast Beef", @"Vegemite", nil];
    self.fillingType = array2;
    [array1 release];
    [array2 release];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.doublePicker = nil;
    self.fillingType = nil;
    self.breadType = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - Picker Data Source methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == kFillingComponent) {
        return [self.fillingType count];
    }
    else
        return [self.breadType count];
}
#pragma Picker Data Delegete methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == kFillingComponent) {
        return [self.fillingType objectAtIndex:row];
    }
    else
        return [self.breadType objectAtIndex:row];
}

@end
