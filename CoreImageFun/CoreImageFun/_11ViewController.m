//
//  _11ViewController.m
//  CoreImageFun
//
//  Created by zewenli on 1/13/14.
//  Copyright (c) 2014 Steven. All rights reserved.
//

#import "_11ViewController.h"

@interface _11ViewController ()

@end

@implementation _11ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *filePath =
    [[NSBundle mainBundle] pathForResource:@"image" ofType:@"png"];
    NSURL *fileNameAndPath = [NSURL fileURLWithPath:filePath];
    
    CIImage *beginImage =
    [CIImage imageWithContentsOfURL:fileNameAndPath];
    
    // 1
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
                                  keysAndValues: kCIInputImageKey, beginImage,
                        @"inputIntensity", @0.8, nil];
    CIImage *outputImage = [filter outputImage];
    
    // 2
    CGImageRef cgimg =
    [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    // 3
    UIImage *newImage = [UIImage imageWithCGImage:cgimg];
    self.imageView.image = newImage;
    
    // 4
    CGImageRelease(cgimg);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
