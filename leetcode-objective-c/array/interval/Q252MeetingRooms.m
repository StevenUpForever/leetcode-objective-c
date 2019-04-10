//
//  Q252MeetingRooms.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 4/9/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q252MeetingRooms.h"
#import "Interval.h"

@implementation Q252MeetingRooms

//TAG: Facebook
//TAG: array
//Difficulty: Easy

/**
 * 252. Meeting Rooms
 * Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), determine if a person could attend all meetings.
 *
 * For example,
 * Given [[0, 30],[5, 10],[15, 20]],
 * return false.
 */

/*
 * Solution:
 * Sort intervals by start so we could compare one factor, when two intervals can merge, (first.end > second.start)
 * then cannot attend both, return false, otherwise set local interval to current in array for next compare
 *
 * if all compared, then return true
 *
 * Time: O(nlogn + n)
 * Space: O(1)
 */

- (BOOL)canAttendMeetings: (NSArray<Interval *> *)intervals {
    intervals = [intervals sortedArrayUsingComparator:^NSComparisonResult(Interval  *_Nonnull obj1, Interval  *_Nonnull obj2) {
        return obj1.start - obj2.start;
    }];
    Interval *first = intervals.firstObject;
    for (NSInteger i = 1; i < intervals.count; i++) {
        if (first.end > intervals[i].start) return NO;
        first = intervals[i];
    }
    return YES;
}

@end
