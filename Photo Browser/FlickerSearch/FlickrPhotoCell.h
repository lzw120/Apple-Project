//
//  FlickrPhotoCell.h
//  FlickerSearch
//
//  Created by zewenli on 1/10/14.
//  Copyright (c) 2014 ZewenLi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FlickrPhoto;
@interface FlickrPhotoCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) FlickrPhoto *photo;

@end
