//
//  TweetData.h
//  localFuckingTweets
//
//  Created by Michael Thompson on 12/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetData : NSObject {
    NSString *username, *tweetText, *avatarImageURL;
}
@property(nonatomic, retain)NSString *username, *tweetText, *avatarImageURL;
+ (id)tweetDataWithName:(NSString *)name andText:(NSString *)text andAvatarURL:(NSString *)avatarURL;
@end
