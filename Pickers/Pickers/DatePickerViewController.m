//
//  DatePickerViewController.m
//  Pickers
//
//  Created by Zewen Li on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DatePickerViewController.h"

@implementation DatePickerViewController

@synthesize datePicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)buttonPressed:(id)sender {
    NSDate *selected = [datePicker date];
    NSString *msg = [[NSString alloc] initWithFormat:@"the date you choose is: %@", selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date and time selected" message:msg delegate:nil cancelButtonTitle:@"yes I did" otherButtonTitles: nil];
    [alert show];
    [alert release];
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
    NSDate *now = [[NSDate alloc] init];
    [datePicker setDate:now animated:NO];
    [now release];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.datePicker = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
