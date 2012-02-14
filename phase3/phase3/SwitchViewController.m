//
//  SwitchViewController.m
//  phase3
//
//  Created by Zewen Li on 1/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SwitchViewController.h"
#import "YellowViewController.h"
#import "BlueViewController.h"

@implementation SwitchViewController
@synthesize blueViewController;
@synthesize yellowViewController;

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
    if (self.blueViewController.view.superview == nil) {
        self.blueViewController = nil;
    }
    else
        self.yellowViewController = nil;
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (IBAction)switchViews:(id)sender {
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if (self.yellowViewController.view.superview == nil) {
        if (self.yellowViewController.view == nil) {
            YellowViewController *yelloController = [[YellowViewController alloc] initWithNibName:@"YellowViewController" bundle:nil];
            self.yellowViewController = yelloController;
            [yelloController release];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
        [blueViewController viewWillAppear:YES];
        [yellowViewController viewWillDisappear:YES];
        
        [blueViewController.view removeFromSuperview];
        [self.view insertSubview:yellowViewController.view atIndex:0];
        
        [yellowViewController viewDidDisappear:YES];
        [blueViewController viewDidAppear:YES];
        
        
    }
    else
    {
        if (self.blueViewController == nil) {
            BlueViewController *blueController = [[BlueViewController alloc]initWithNibName:@"BlueViewController" bundle:nil];
            self.blueViewController = blueController;
            [blueController release];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
        [yellowViewController viewWillAppear:YES];
        [blueViewController viewWillDisappear:YES];
        
        [yellowViewController.view removeFromSuperview];
        [self.view insertSubview:blueViewController.view atIndex:0];
        
        [blueViewController viewDidDisappear:YES];
        [yellowViewController viewDidAppear:YES];
    }
    [UIView commitAnimations];
}


- (void)viewDidLoad
{
    // Do any additional setup after loading the view from its nib.
    BlueViewController *blueController = [[BlueViewController alloc] initWithNibName:@"BlueViewController"bundle:nil]; 
    self.blueViewController = blueController;
    [self.view insertSubview:blueController.view atIndex:0];
    [blueController release];
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [yellowViewController dealloc];
    [blueViewController dealloc];
    [super dealloc];
}

@end
