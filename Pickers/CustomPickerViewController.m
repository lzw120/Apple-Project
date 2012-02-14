//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by Zewen Li on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomPickerViewController.h"

@implementation CustomPickerViewController
@synthesize picker;
@synthesize winLabel;
@synthesize column1;
@synthesize column2;
@synthesize column3;
@synthesize column4;
@synthesize column5;
@synthesize button;

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

- (void) showButton {
    self.button.hidden = NO;
}

- (void) playWithSound {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"win" ofType:@"wav"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID( (CFURLRef)[NSURL fileURLWithPath:path], &soundID);
    AudioServicesPlaySystemSound(soundID);
    winLabel.text = @"WIN";
    [self performSelector:@selector(showButton) withObject:nil afterDelay:1.5];
}

// judge whether 5 integers have three the same
//- (BOOL)judgeWin: a1, a2, a3, a4,a5 
//{
//    NSArray *array = [[NSArray alloc] initWithObjects:a1,a2,a3,a4,a5]; 
//    NSArray *sorted = [array sortedArrayUsingSelector:@selector(compare:)];
//    if (a1 == a2 && a2 == a3) 
//    {
//        return YES;
//    }
//    if (a2 == a3 && a3 == a4)
//    {
//        return YES;
//    }
//    if (a3 == a4 && a4 == a5)
//    {
//        return YES;
//    }
//    return NO;
//}

- (IBAction)spin:(id)sender {
    BOOL win = NO;
    int numInRow = 1;
    int lastVal = -1;
    for (int i = 0; i < 5; i++) {
        int newValue = random() % [self.column1 count];
        if (newValue == lastVal) {
            numInRow++;
        }
        else
            numInRow = 1;
        lastVal = newValue;
        [picker selectRow:newValue inComponent:i animated:YES];
        [picker reloadComponent:i];
        //[UIView commitAnimations];    
        if (numInRow >= 3) {
            win = YES;
        }
    }
    
    button.hidden = YES;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID( (CFURLRef)[NSURL fileURLWithPath:path], &soundID);
    AudioServicesPlaySystemSound(soundID);
    
    if (win) {
        [self performSelector:@selector(playWithSound) withObject:nil afterDelay:1.5];
        //winLabel.text = @"Win";
    }
    else
    {
        [self performSelector:@selector(showButton) withObject:nil afterDelay:1.5];
        winLabel.text = @"Lose";
    }

}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *seven = [UIImage imageNamed:@"seven.png"];
    UIImage *bar = [UIImage imageNamed:@"bar.png"];
    UIImage *crown = [UIImage imageNamed:@"crown.png"];
    UIImage *cherry = [UIImage imageNamed:@"cherry.png"];
    UIImage *lemon = [UIImage imageNamed:@"lemon.png"];
    UIImage *apple = [UIImage imageNamed:@"apple.png"];
    for (int i = 1; i <= 5; i++) {
        UIImageView *sevenView = [[UIImageView alloc] initWithImage:seven];
        UIImageView *barView = [[UIImageView alloc] initWithImage:bar];
        UIImageView *crownView = [[UIImageView alloc] initWithImage:crown];
        UIImageView *cherryView = [[UIImageView alloc] initWithImage:cherry];
        UIImageView *lemonView = [[UIImageView alloc] initWithImage:lemon];
        UIImageView *appleView = [[UIImageView alloc] initWithImage:apple];
        NSArray *imageViewArray = [[NSArray alloc] initWithObjects:sevenView, barView, crownView, cherryView, lemonView, appleView, nil];
        NSString *fieldName = [[NSString alloc] initWithFormat:@"column%d",i];
        [self setValue:imageViewArray forKey:fieldName];
        [fieldName release];
        [imageViewArray release];
        [seven release];
        [barView release];
        [crownView release];
        [cherryView release];
        [lemonView release];
        [appleView release];
        
    }
    srandom(time(NULL));
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.picker = nil;
    self.winLabel = nil;
    self.column1 = nil;
    self.column2 = nil;
    self.column3 = nil;
    self.column4 = nil;
    self.column5 = nil;
    self.button = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - data source
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 5;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.column1 count];
}

#pragma mark data delegate
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    NSString *fieldName = [[NSString alloc] initWithFormat:@"column%d",component+1 ];
    NSArray *array = [self valueForKey: fieldName];
    return [array objectAtIndex:row];
    
}

@end
