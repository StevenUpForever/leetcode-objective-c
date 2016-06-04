//
//  Problem51To60.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 6/3/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem51To60.h"

@implementation Problem51To60

/*
 57. Insert Interval
 Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).
 
 You may assume that the intervals were initially sorted according to their start times.
 
 Example 1:
 Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].
 
 Example 2:
 Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in as [1,2],[3,10],[12,16].
 
 This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].
 */
- (NSArray<Interval *> *)insert: (NSArray<Interval *> *)intervals newInterval: (Interval *)newInterval {
    NSMutableArray<Interval *> *result = [[NSMutableArray alloc]init];
    NSInteger index = 0;
    while (index < intervals.count && intervals[index].end < newInterval.start) {
        [result addObject:intervals[index++]];
    }
    while (index < intervals.count && intervals[index].start <= newInterval.end) {
        newInterval = [[Interval alloc]initWithStart:MIN(intervals[index].start, newInterval.start) andEnd:MAX(intervals[index].end, newInterval.end)];
        index++;
    }
    [result addObject:newInterval];
    while (index < intervals.count) {
        [result addObject:intervals[index++]];
    }
    return result;
}

@end

@implementation Interval

- (instancetype)initWithStart: (NSInteger)start andEnd: (NSInteger)end
{
    self = [super init];
    if (self) {
        _start = start;
        _end = end;
    }
    return self;
}

@end

