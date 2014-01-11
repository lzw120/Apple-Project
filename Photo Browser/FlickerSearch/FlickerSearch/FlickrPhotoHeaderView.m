//
//  FlickrPhotoHeaderView.m
//  FlickerSearch
//
//  Created by ZewenLi on 1/11/14.
//  Copyright (c) 2014 ZewenLi. All rights reserved.
//

#import "FlickrPhotoHeaderView.h"

@implementation FlickrPhotoHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setSearchText:(NSString *)text {
    self.searchLabel.text = text;
    UIImage *shareButtonImage = [[UIImage imageNamed:@"header_bg.png"] resizableImageWithCapInsets:
                                 UIEdgeInsetsMake(68, 68, 68, 68)];
    self.backgroundImageView.image = shareButtonImage;
    self.backgroundImageView.center = self.center;
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
