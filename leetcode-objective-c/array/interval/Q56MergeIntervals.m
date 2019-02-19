//
//  Q56MergeIntervals.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q56MergeIntervals.h"
#import "Interval.h"

@implementation Q56MergeIntervals

//TAG: Google
//TAG: Facebook
//TAG: Microsoft
//TAG: LinkedIn
//TAG: Snap
//TAG: Apple
//TAG: array
//Difficulty: Medium

/**
 * 56. Merge Intervals
 * Given a collection of intervals, merge all overlapping intervals.
 
 For example,
 Given [1,3],[2,6],[8,10],[15,18],
 return [1,6],[8,10],[15,18].
 */

/*
 * Solution 1:
 * Sort List by start, and compare/merge all ends
 *      if cur.end >= next.start
 *          means cur and next could be merge, then the new interval.end is the max(cur.end, next.end)
 *          delete the next
 *          the compare current to the 3rd next to current (2nd after delete the 2nd)
 *      else index++
 *
 * Time: if intervals is kinds of ArrayList, Due to delete the 2nd if merge, will move all behind intervals to pre 1 index, so O(n - 1) + O(n - 2) + ... + O(1) = O(n ^ 2)
 * If intervals is kinds of LinkedList O(n)
 * Space: O(1)
 */

- (NSArray<Interval *> *)merge1: (NSArray<Interval *> *)intervals {
    NSMutableArray<Interval *> *res = [NSMutableArray new];
    intervals = [intervals sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Interval *interVal1 = (Interval *)obj1,
        *interVal2 = (Interval *)obj2;
        return interVal1.start < interVal2.start ? NSOrderedAscending : NSOrderedDescending;
    }];
    for (Interval *interval in intervals) {
        if (res.count == 0) {
            [res addObject:interval];
        } else {
            Interval *cur = res.lastObject;
            if (cur.end >= interval.start) {
                cur.end = MAX(cur.end, interval.end);
            } else {
                [res addObject:interval];
            }
        }
    }
    return [res copy];
}

@end
