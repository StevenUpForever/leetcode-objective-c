//
//  Search_Insert_Position.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/24/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Search_Insert_Position.h"

@implementation Search_Insert_Position

/**
 * 35. Search Insert Position
 * Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 Here are few examples.
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 */

/**
 * Solution:
 * Binary search, when find target, return its index
 * do the post step type binary search, do left left smaller than target and right larger than target, then return right (right index is the index where to insert the target number
 *
 * Time: O(logn)
 * Space: O(1)
 */
- (NSInteger)searchInsert: (NSArray *)nums target: (NSNumber *)target {
    if (nums.count == 0) return -1;
    NSInteger l = 0, r = nums.count - 1;
    while (l < r - 1) {
        NSInteger mid = l + (r - l)/2;
        if ([nums[mid] isEqualToNumber:target]) return mid;
        else if ([nums[mid] compare:target] == NSOrderedAscending) l = mid;
        else r = mid;
    }
    //Corner case, if all numbers smaller than target, left is the right index
    //As test case in LeetCode, [1, 3], 1, return 0, mean if left is equal to target, insert at left of left
    if ([nums[l] integerValue] >= target.integerValue) return l;
    //If right smaller than target, the index is smaller + 1, is right + 1
    else if ([nums[r] integerValue] < target.integerValue) return r + 1;
    return r;
}

@end
