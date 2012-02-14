//
//  CustomCell.m
//  Cells
//
//  Created by Zewen Li on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize nameLabel;
@synthesize contentView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) dealloc {
    [nameLabel release];
    [colorLabel release];
    [super dealloc];
}

@end
