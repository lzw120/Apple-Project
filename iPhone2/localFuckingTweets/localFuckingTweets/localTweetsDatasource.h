//
//  localTweetsDatasource.h
//  localFuckingTweets
//
//  Created by Michael Thompson on 12/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface localTweetsDatasource : NSObject {
    NSMutableArray *datasource;
}
@property(nonatomic, retain)NSMutableArray *datasource;
@end
