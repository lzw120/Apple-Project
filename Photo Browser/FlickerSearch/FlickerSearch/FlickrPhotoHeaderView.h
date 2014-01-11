//
//  FlickrPhotoHeaderView.h
//  FlickerSearch
//
//  Created by ZewenLi on 1/11/14.
//  Copyright (c) 2014 ZewenLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrPhotoHeaderView : UICollectionReusableView

@property(weak) IBOutlet UIImageView *backgroundImageView;
@property(weak) IBOutlet UILabel *searchLabel;

-(void)setSearchText:(NSString *)text;

@end
