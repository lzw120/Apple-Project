//
//  TweetDataTableCell.m
//  localTweets
//
//  Created by Michael Thompson on 12/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TweetDataTableCell.h"

@implementation TweetDataTableCell
@synthesize username, tweetText, avatarView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    self.username = nil;
    self.tweetText = nil;
    self.avatarView = nil;
    [super dealloc];
}

@end
