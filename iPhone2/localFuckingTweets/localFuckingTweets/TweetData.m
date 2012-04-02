//
//  TweetData.m
//  localFuckingTweets
//
//  Created by Michael Thompson on 12/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TweetData.h"

@implementation TweetData
@synthesize username, tweetText;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (id)tweetDataWithName:(NSString *)name andText:(NSString *)text {
    TweetData *result = [[[TweetData alloc] init] autorelease];
    result.username = name;
    result.tweetText = text;
    
    return result;
}

@end
