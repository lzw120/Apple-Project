//
//  ViewController.h
//  FlickerSearch
//
//  Created by ZewenLi on 1/9/14.
//  Copyright (c) 2014 ZewenLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flickr.h"
#import "FlickrPhoto.h"

@interface ViewController : UIViewController

@property(nonatomic, weak) IBOutlet UIToolbar *toolbar;
@property(nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
@property(nonatomic, weak) IBOutlet UITextField *textField;
- (IBAction)shareButtonTapped:(id)sender;

@property(nonatomic, strong) NSMutableDictionary *searchResults;
@property(nonatomic, strong) NSMutableArray *searches;
@property(nonatomic, strong) Flickr *flickr;
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;


@end
