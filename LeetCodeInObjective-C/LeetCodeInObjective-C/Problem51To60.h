//
//  Problem51To60.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 6/3/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Interval;
@interface Problem51To60 : NSObject

- (NSArray *)spiralOrder: (NSArray<NSArray *> *)matrix;
- (NSArray<Interval *> *)insert: (NSArray<Interval *> *)intervals newInterval: (Interval *)newInterval;

@end

@interface Interval : NSObject

@property (nonatomic, assign) NSInteger start;
@property (nonatomic, assign) NSInteger end;

- (instancetype)initWithStart: (NSInteger)start andEnd: (NSInteger)end;

@end
