//
//  _11ViewController.m
//  CoreImageFun
//
//  Created by zewenli on 1/13/14.
//  Copyright (c) 2014 Steven. All rights reserved.
//

#import "_11ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface _11ViewController ()<UIImagePickerControllerDelegate, UINavigationBarDelegate> {
    CIContext *context;
    CIFilter *filter;
    __weak IBOutlet UISlider *amountSlider;
    CIImage *beginImage;
}

@end

@implementation _11ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *filePath =
    [[NSBundle mainBundle] pathForResource:@"image" ofType:@"png"];
    NSURL *fileNameAndPath = [NSURL fileURLWithPath:filePath];
    
    beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
    context = [CIContext contextWithOptions:nil];
    
    filter = [CIFilter filterWithName:@"CISepiaTone"
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity",
              @0.8, nil];
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

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *gotImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    beginImage = [CIImage imageWithCGImage:gotImage.CGImage];
    [filter setValue:beginImage forKey:kCIInputImageKey];
    [self amountSliderValueChanged:amountSlider];
}

- (void)imagePickerControllerDidCancel:
(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loadPhoto:(id)sender {
    UIImagePickerController *pickerC = [[UIImagePickerController alloc] init];
    pickerC.delegate = self;
    [self presentViewController:pickerC animated:YES completion:nil];
}

- (IBAction)amountSliderValueChanged:(UISlider *)slider {
    float slideValue = slider.value;
    
    dispatch_queue_t queue = dispatch_queue_create("com.dispatch.serial", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        
        CIImage *outputImage = [filter outputImage];
        
        CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
        
        UIImage *newImage = [UIImage imageWithCGImage:cgimg];
        

        [filter setValue:@(slideValue)
                  forKey:@"inputIntensity"];
        //self.imageView.image = newImage;
        [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:newImage waitUntilDone:YES];
        
        CGImageRelease(cgimg);
        
    });
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
