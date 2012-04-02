//
//  TweetDataTableCell.h
//  localTweets
//
//  Created by Michael Thompson on 12/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetDataTableCell : UITableViewCell {
    IBOutlet UILabel *username, *tweetText;
    IBOutlet UIImageView *avatarView;
}
@property(nonatomic, retain) IBOutlet UILabel *username, *tweetText;
@property(nonatomic, retain) IBOutlet UIImageView *avatarView;
@end
