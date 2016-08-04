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
 54. Spiral Matrix
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
 
 For example,
 Given the following matrix:
 
 [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
 ]
 You should return [1,2,3,6,9,8,7,4,5].
 */
- (NSArray *)spiralOrder: (NSArray<NSArray *> *)matrix {
    NSMutableArray *result = [[NSMutableArray alloc]init];
    if (matrix.count == 0) {
        return result;
    }
    NSUInteger x = 0, y = 0;
    NSUInteger lenX = matrix.count, lenY = matrix[0].count;
    while (x < lenX && y < lenY) {
        for (NSUInteger i = y; i < lenY; i++) [result addObject:matrix[x][i]];
        x++;
        for (NSUInteger j = x; j < lenX; j++) [result addObject:matrix[j][lenY - 1]];
        lenY--;
        for (NSUInteger m = lenY - 1; x < lenX && m >= y; m--) [result addObject:matrix[lenX - 1][m]];
        lenX--;
        for (NSUInteger n = lenX - 1; y < lenY && n >= x; n--) [result addObject:matrix[n][y]];
        y++;
    }
    return result;
}

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

