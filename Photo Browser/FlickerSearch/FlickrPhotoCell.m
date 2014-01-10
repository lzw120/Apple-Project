//
//  FlickrPhotoCell.m
//  FlickerSearch
//
//  Created by zewenli on 1/10/14.
//  Copyright (c) 2014 ZewenLi. All rights reserved.
//

#import "FlickrPhotoCell.h"
#import "FlickrPhoto.h"
@implementation FlickrPhotoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) setPhoto:(FlickrPhoto *)photo {
    
    if(_photo != photo) {
        _photo = photo;
    }
    self.imageView.image = _photo.thumbnail;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
