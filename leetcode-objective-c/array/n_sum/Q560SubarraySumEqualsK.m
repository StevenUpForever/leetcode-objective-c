//
//  Q560SubarraySumEqualsK.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/13/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q560SubarraySumEqualsK.h"

@implementation Q560SubarraySumEqualsK

//Difficulty: Medium
//TAG: Snap
//TAG: presum
//TAG: array

/**
 * 560. Subarray Sum Equals K
 * Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
 *
 * Example 1:
 * Input:nums = [1,1,1], k = 2
 * Output: 2
 * Note:
 * The length of the array is in range [1, 20,000].
 * The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
 */

/*
 Solution:
 Use presum array to quick filter subarray sum, use two sum to quick find designated subarray sum
 
 Time: O(n)
 Space: O(n)
 */

- (NSInteger)subarraySum: (NSArray<NSNumber *> *)nums :(NSInteger) k {
    NSInteger count = 0, sum = 0;
    NSMutableDictionary<NSNumber *, NSNumber *> *dict = [NSMutableDictionary new];
    dict[@0] = @1;
    for (NSNumber *num in nums) {
        sum += num.integerValue;
        if (dict[@(sum)]) {
            count += dict[@(sum)].integerValue;
            dict[@(sum)] = @(dict[@(sum)].integerValue + 1);
        } else dict[@(sum)] = @1;
    }
    return count;
}

@end
