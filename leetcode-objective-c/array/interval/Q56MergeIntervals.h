//
//  Q56MergeIntervals.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Interval;
@interface Q56MergeIntervals : NSObject

- (NSArray<Interval *> *)merge1: (NSArray<Interval *> *)intervals;

@end

NS_ASSUME_NONNULL_END
