//
//  Problem321To330.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 2/5/17.
//  Copyright © 2017 ChengzhiJia. All rights reserved.
//

#import "Problem321To330.h"

@implementation Problem321To330

/*
 325. Maximum Size Subarray Sum Equals k
 Given an array nums and a target value k, find the maximum length of a subarray that sums to k. If there isn't one, return 0 instead.
 
 Note:
 The sum of the entire nums array is guaranteed to fit within the 32-bit signed integer range.
 
 Example 1:
 Given nums = [1, -1, 5, -2, 3], k = 3,
 return 4. (because the subarray [1, -1, 5, -2] sums to 3 and is the longest)
 
 Example 2:
 Given nums = [-2, -1, 2, 1], k = 1,
 return 2. (because the subarray [-1, 2] sums to 1 and is the longest)
 Follow Up:
 Can you do it in O(n) time?
 */

/*
Second approach: Use HashMap store all existed elements sum as key, index as value, check current sum equal to k or sum - k key existed
(indicate there's part sum from some start index could have sum equal to k), put key value pair if not existed
Time: O(n)(+ O(n) containsKey() API)
Space: O(n)
*/
- (int)maxSubarrayLen: (NSArray *)nums numK: (NSNumber *)k {
    if (nums == nil || nums.count == 0) {
        return 0;
    }
    int sum = 0, max = 0;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < nums.count; i++) {
        sum += [nums[i] integerValue];
        if (sum == [k integerValue]) {
            //If sum == k, i should be largest index currently, and no need to watch the existed key in map, like [1, 0, 0, 0], 1
            max = i + 1;
            //map.containsKey(sum - k) is key point, sum - k means part sum from uncertain start equals to k
        } else if ([dict.allKeys containsObject:[NSNumber numberWithInteger:sum - [k integerValue]]]) {
            max = MAX(max, i - [dict[[NSNumber numberWithInteger:sum - [k integerValue]]] intValue]);
        }
        if (![dict.allKeys containsObject:[NSNumber numberWithInteger:sum]]) {
            dict[[NSNumber numberWithInteger:sum]] = [NSNumber numberWithInteger:i];
        }
    }
    return max;
}

@end
