//
//  Problem31To40.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/28/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem31To40.h"

@implementation Problem31To40

/*
 33. Search in Rotated Sorted Array
 Suppose a sorted array is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 You are given a target value to search. If found in the array return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.
 */
- (NSInteger)search: (NSArray *)A  target: (NSNumber *)target {
    if (A.count == 0) return -1;
    NSInteger start = 0, end = A.count - 1;
    while (start <= end) {
        NSInteger middle = (start + end)/2;
        if (A[middle] == target) return middle;
        if ([A[start] integerValue] <= [A[middle] integerValue]) {
            if ([target integerValue] < [A[middle] integerValue] && [target integerValue] >= [A[start] integerValue]) {
                end = middle - 1;
            } else {
                start = middle + 1;
            }
        } else {
            if ([A[middle] integerValue] < [target integerValue] && [target integerValue] <= [A[end] integerValue]) {
                start = middle + 1;
            } else {
                end = middle - 1;
            }
        }
    }
    return -1;
}

@end
