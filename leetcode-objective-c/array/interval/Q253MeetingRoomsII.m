//
//  Q253MeetingRoomsII.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/11/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q253MeetingRoomsII.h"
#import "Interval.h"

@implementation Q253MeetingRoomsII

//Difficulty: Medium
//TAG: Facebook
//TAG: Google
//TAG: Snap
//TAG: Uber
//TAG: Apple
//TAG: Array
//TAG: range

/**
 * 253. Meeting Rooms II
 * Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.
 
 For example,
 Given [[0, 30],[5, 10],[15, 20]],
 return 2.
 */

/*
 * Solution:
 * Don't need to consider every interval as a single interval but two numbers, start and end, gather all starts
 * and ends
 *
 * sort starts and ends in ascending order
 * compare start and end, if start < end, need room, room++
 * otherwise move end try to find the end > start
 *
 * Time: O(n + 2nlogn + 2n) = O(nlogn)
 * Space: O(n)
 */

- (NSInteger)minMeetingRooms: (NSArray<Interval *> *)intervals {
    NSMutableArray<NSNumber *> *start = [NSMutableArray new],
    *end = [NSMutableArray new];
    for (NSInteger i = 0; i < intervals.count; i++) {
        [start addObject:@(intervals[i].start)];
        [end addObject:@(intervals[i].end)];
    }
    [start sortUsingComparator:^NSComparisonResult(NSNumber  * _Nonnull obj1, NSNumber * _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    [end sortUsingComparator:^NSComparisonResult(NSNumber  * _Nonnull obj1, NSNumber * _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    NSInteger count = 0;
    NSInteger endIndex = 0;
    for (NSInteger i = 0; i < start.count; i++) {
        if (start[i].integerValue < end[endIndex].integerValue) {
            count++;
        } else endIndex++;
    }
    return count;
}

@end
