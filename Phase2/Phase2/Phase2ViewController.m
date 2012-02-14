//
//  Phase2ViewController.m
//  Phase2
//
//  Created by Zewen Li on 1/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Phase2ViewController.h"

@implementation Phase2ViewController

@synthesize landscapebarbutton;
@synthesize landscapefoobutton;
@synthesize portraitbarbutton;
@synthesize portraitfoobutton;
//@synthesize button5;
//@synthesize button6;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)InterfaceOrientation duration:(NSTimeInterval)duration {
    if (InterfaceOrientation == UIInterfaceOrientationPortrait)
        {
            self.view = portrait;
            self.view.transform = CGAffineTransformIdentity;
            self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(0));
            self.view.bounds = CGRectMake(0, 0, 300, 480);
        }
    else if (InterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    {
        self.view = landscape;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform  = CGAffineTransformMakeRotation(degreesToRadians(-90));
        self.view.bounds = CGRectMake(0, 0, 460, 320);
    }
    else if (InterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        self.view = landscape;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform  = CGAffineTransformMakeRotation(degreesToRadians(90));
        self.view.bounds = CGRectMake(0, 0, 460, 320);
    }
    else if (InterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        self.view = portrait;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform  = CGAffineTransformMakeRotation(degreesToRadians(180));
        self.view.bounds = CGRectMake(0, 0, 300, 480);
    }
}


- (IBAction) buttonPressed:(id)sender
{
    if (sender == landscapebarbutton || sender == portraitbarbutton) {
        landscapebarbutton.hidden = YES;
        portraitbarbutton.hidden = YES;
    }
    else 
    {
        landscapefoobutton.hidden = YES;
        portraitfoobutton.hidden = YES;
    }
}


#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.landscapefoobutton = nil;
    self.landscapefoobutton = nil;
    self.portraitfoobutton = nil;
    self.portraitfoobutton = nil;
//    self.button5 = nil;
//    self.button6 = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return YES;//
    //(interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) dealloc {
    [landscapefoobutton release];
    [landscapebarbutton release];
    [portraitfoobutton release];
    [portraitbarbutton release];
//    [button5 release];
//    [button6 release];
    [super dealloc];
    
}


@end
