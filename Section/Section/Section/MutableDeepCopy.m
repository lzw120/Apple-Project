//
//  MutableDeepCopy.m
//  Section
//
//  Created by Zewen Li on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MutableDeepCopy.h"

@implementation NSDictionary(MutableDeepCopy)

- (NSMutableDictionary *)mutableDeepCopy {
    NSMutableDictionary *returnDic = [[NSMutableDictionary alloc] initWithCapacity: [self count]];
    NSArray *keys = [self allKeys];
    for (id key in keys) {
        id oneValue = [self valueForKey:key];
        id oneCopy = nil;
        if ([oneValue respondsToSelector:@selector(mutableDeepCopy)]) {
            oneCopy = [oneValue mutableDeepCopy];
        }
        else if ([oneValue respondsToSelector:@selector(mutableCopy)])
        {
            oneCopy = [oneValue mutableCopy];
        }
        if (oneCopy == nil) {
            oneCopy = [oneValue copy];
        }
        [returnDic setValue:oneCopy forKey:key];
        
    }
    return returnDic;
    
}

@end
