//
//  TweetData.h
//  localFuckingTweets
//
//  Created by Michael Thompson on 12/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetData : NSObject {
    NSString *username, *tweetText;
}
@property(nonatomic, retain)NSString *username, *tweetText;
@end
