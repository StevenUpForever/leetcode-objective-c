//
//  Search_in_Rotated_Sorted_Array.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/23/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Q33SearchInRotatedSortedArray.h"

@implementation Q33SearchInRotatedSortedArray

//TAG: Facebook
//TAG: Microsoft
//TAG: Uber
//TAG: LinkedIn
//TAG: Apple
//TAG: Binary search
//Difficulty: Medium

/**
 * 33. Search in Rotated Sorted Array
 * Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 You are given a target value to search. If found in the array return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.
 */

/*
 * Solution:
 * Although rotated array, but still partial sorted, use binary search, add few if condition is each binary step
 * there are two conditions which will unique determine the next step of binary search
 *      1. when the array is like 456789123, left part larger than right part, which the target is within 4...9 left < middle
 *              middle > target && left < target, right = middle - 1, otherwise left = middle + 1
 *      2. when the array is like 789123456, left part smaller than right part, target within 1...6, right > middle
 *              middle < target && right > target left = middle + 1 otherwise right = middle - 1
 *
 * ****** be aware of the corner case if >= or > ******
 *
 * Time: O(logn)
 * Space: O(1)
 */

- (NSInteger)search: (NSArray *)nums target: (NSNumber *)target {
    if (nums.count == 0) return -1;
    NSInteger left = 0, right = nums.count - 1;
    //left == right as final case due to each step will skip the middle, left = mid - 1 or right = mid + 1 so will not infinite loop
    while (left <= right) {
        //better than (left + right)/2 may overflow when left + right
        NSInteger mid = left + (right -  left)/2;
        if ([nums[mid] isEqualToNumber:target]) return mid;
        //left has a condition when == middle, only one number in this step and exactly the right one
        else if ([nums[left] compare:nums[mid]] == NSOrderedAscending) {
            if ([nums[mid] compare:target] == NSOrderedDescending && [nums[left] compare:target] == NSOrderedAscending)
                right = mid - 1;
            else left = mid + 1;
        } else {
            if ([nums[mid] compare:target] == NSOrderedAscending && [nums[right] compare:target] == NSOrderedDescending)
                left = mid + 1;
            else right = mid - 1;
        }
    }
    return -1;
}

@end
