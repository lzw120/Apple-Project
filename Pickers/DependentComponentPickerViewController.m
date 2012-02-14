//
//  DependentComponentPickerViewController.m
//  Pickers
//
//  Created by Zewen Li on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DependentComponentPickerViewController.h"

@implementation DependentComponentPickerViewController

@synthesize picker;
@synthesize states;
@synthesize zips;
@synthesize stateZips;

- (IBAction)buttonPressed:(id)sender {
    NSInteger stateRow = [self.picker selectedRowInComponent:kStateComponent];
    NSInteger zipRow = [self.picker selectedRowInComponent:kZipComponent];
    NSString *stateMsg = [self.states objectAtIndex:stateRow];
    NSString *zipMsg = [self.zips objectAtIndex:zipRow];
    NSString *msg = [[NSString alloc] initWithFormat:@"your select state is %@, zip code is %@", stateMsg, zipMsg];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:msg message:msg delegate:nil cancelButtonTitle:@"yes I did" otherButtonTitles: nil];
    [alert show];
    [alert release];
    [stateMsg release];
    [zipMsg release];
    [msg release];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"statedictionary" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.stateZips = dictionary;

    NSArray *components = [self.stateZips allKeys];
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    self.states = sorted;

    
    NSString *selectedstate = [self.states objectAtIndex:0];
    NSArray *array = [self.stateZips objectForKey: selectedstate];
    self.zips = array;
    //[array release];
    [dictionary release];
    //[sorted release];
    //[components release];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.picker = nil;
    self.states = nil;
    self.zips = nil;
    self.stateZips = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - data source method
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == kStateComponent) {
        return [self.states count];
    }
    else
        return [self.zips count];
}

#pragma mark data delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == kStateComponent) {
        return [self.states objectAtIndex:row];
    }
    else
        return [self.zips objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == kStateComponent) {
        NSString *selectedState = [self.states objectAtIndex:row];
        self.zips = [self.stateZips objectForKey:selectedState];
        [self.picker selectRow:0 inComponent:kZipComponent animated:YES];
        [self.picker reloadComponent:kZipComponent];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == kZipComponent) {
        return 90;
    }
    else
        return 200;
}

@end
