//
//  Two_Sum.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/10/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Two_Sum.h"

@implementation Two_Sum

/**
 1. Two Sum
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

/**
 * Solution 1: Brute force high time, low space
 * Two loops, which outer loop start from begin to the last second element, inner loop from next element of current i to the end of array, when met the target, return the new build array
 *
 * Time: Get inner j loop as pivot, n represent the length of array, O(n - 1) + O(n - 2) + ... + O(1) = O(n(n + 1)/2) = O(n^2)
 * Space: O(2) new alloc 2 space result array = O(1)
 */
- (NSArray *)twoSumS1: (NSArray *)nums target: (NSInteger)target {
    NSMutableArray *res = [[NSMutableArray alloc]init];
    for (int i = 0; i < nums.count - 1; i++) {
        for (int j = i + 1; j < nums.count; j++) {
            if ([nums[i] integerValue] + [nums[j] integerValue] == target) {
                [res addObject:nums[i]];
                [res addObject:nums[j]];
                return res;
            }
        }
    }
    return res;
}

/**
 * Solution 2: HashMap high space, low time
 * Use hashMap to record current value pairs with current index, one loop to iterative the array to find rest of number which could add to target or record current number
 *
 * Time: O(n) n represent the length of array
 * Space: O(n) the worst case the when find the result at the end of array or find no result after iterative all the array
 */
- (NSArray *)twoSumS2: (NSArray *)nums target: (NSInteger)target {
    NSMutableArray *res = [[NSMutableArray alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < nums.count; i++) {
        NSNumber *minus = [NSNumber numberWithInteger: target - [nums[i] integerValue]];
        if (dict[minus]) {
            [res addObject:nums[i]];
            [res addObject:minus];
            return res;
        } else dict[minus] = @1;
        
    }
    return res;
}


@end
