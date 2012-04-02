//
//  TweetData.m
//  localFuckingTweets
//
//  Created by Michael Thompson on 12/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TweetData.h"

@implementation TweetData
@synthesize username, tweetText, avatarImageURL;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (id)tweetDataWithName:(NSString *)name andText:(NSString *)text andAvatarURL:(NSString *)avatarURL{
    TweetData *result = [[[TweetData alloc] init] autorelease];
    result.username = name;
    result.tweetText = text;
    result.avatarImageURL = avatarURL;
    
    return result;
}

- (void)dealloc {
    self.username = nil;
    self.tweetText = nil;
    self.avatarImageURL = nil;
    
    [super dealloc];
}
@end
