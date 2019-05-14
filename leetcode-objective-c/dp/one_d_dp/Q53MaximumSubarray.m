//
//  Q53MaximumSubarray.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/13/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q53MaximumSubarray.h"

@implementation Q53MaximumSubarray

//TAG: LinkedIn
//TAG: Apple
//TAG: DP
//Difficulty: Easy

/**
 * 53. Maximum Subarray
 * Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
 
 For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
 the contiguous subarray [4,-1,2,1] has the largest sum = 6.
 */

/*
 * Solution: DP problem
 * for loop the array once, index i
 * consider about how the current sub sum to i contribute to the max sum
 *      1. if the current sub sum is >= 0 the keep contribute to the global max
 *      2. if the current sub sum is < 0 ignore this part and start the max sum at current index i
 * base case: M[0] = nums[0],
 * Induction rule: M[i] represent the current contribute from 0 ... i, the keep global max to record the result
 * M[i] = M[i - 1] > 0 ? M[i - 1] + nums[i] : nums[i]
 *
 * Time: O(n)
 * Space: O(1)
 */

- (NSInteger)maxSubArray: (NSArray<NSNumber *> *)nums {
    NSInteger cur = NSIntegerMin, max = NSIntegerMin;
    for (NSNumber *num in nums) {
        if (cur < 0) cur = num.integerValue;
        else cur += num.integerValue;
        max = MAX(cur, max);
    }
    return max;
}

@end
