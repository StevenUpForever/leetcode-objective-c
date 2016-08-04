//
//  Problem281To290.h
//  LeetCodeInObjective-C
//
//  Created by Steven Jia on 8/4/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Problem281To290 : NSObject

@end

@interface ValidWordAbbr : NSObject

- (instancetype)initWithStrArray: (NSArray *)dictionary;
- (BOOL)isUnique: (NSString *)word;

@end
