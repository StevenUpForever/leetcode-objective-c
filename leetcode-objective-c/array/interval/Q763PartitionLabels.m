//
//  Q763PartitionLabels.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 4/9/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q763PartitionLabels.h"
#import "Interval.h"

@implementation Q763PartitionLabels

//Difficulty: medium
//TAG: Amazon
//TAG: array
//TAG: interval

/**
 * 763. Partition Labels
 * A string S of lowercase letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.
 *
 * Example 1:
 * Input: S = "ababcbacadefegdehijhklij"
 * Output: [9,7,8]
 * Explanation:
 * The partition is "ababcbaca", "defegde", "hijhklij".
 * This is a partition so that each letter appears in at most one part.
 * A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.
 * Note:
 *
 * S will have length in range [1, 500].
 * S will consist of lowercase letters ('a' to 'z') only.
 */

/*
 Solution:
 
 this is actually overlap intervals of character c (first occur, last occur)
 
 Time: O(n + n) = O(n)
 Space: O(n)
 */

- (NSArray *)partitionLabels: (NSString *)S {
    NSMutableDictionary<NSString *, Interval *> *dict = [NSMutableDictionary new];
    NSMutableArray<Interval *> *intervals = [NSMutableArray new];
    for (NSInteger i = 0; i < S.length; i++) {
        NSString *key = [NSString stringWithFormat:@"%c", [S characterAtIndex:i]];
        if (!dict[key]) {
            Interval *interval = [[Interval alloc]initWithStart:i end:i];
            dict[key] = interval;
            [intervals addObject:interval];
        } else dict[key].end = i;
    }
    NSMutableArray *res = [NSMutableArray new];
    Interval *first = intervals.firstObject;
    for (Interval *cur in intervals) {
        if (first.end < cur.start) {
            [res addObject:@(first.end - first.start + 1)];
            first = cur;
        } else first.end = MAX(first.end, cur.end);
    }
    [res addObject:@(first.end - first.start + 1)];
    return [res copy];
}

@end
