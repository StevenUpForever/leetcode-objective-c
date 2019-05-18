//
//  Q238ProductOfArrayExceptSelf.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q238ProductOfArrayExceptSelf.h"

@implementation Q238ProductOfArrayExceptSelf

//TAG: Facebook
//TAG: Microsoft
//TAG: Amazon
//TAG: LinkedIn
//TAG: Apple
//TAG: dp
//TAG: array
//Difficulty: Medium

/**
 * 238. Product of Array Except Self
 * Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 Solve it without division and in O(n).
 
 For example, given [1,2,3,4], return [24,12,8,6].
 
 Follow up:
 Could you solve it with constant space complexity? (Note: The output array does not count as extra space for the purpose of space complexity analysis.)
 */

/*
 * Solution:
 * Think about the problem, cannot use divide, so we cannot multiple all numbers together and divide nums[i]
 * Solve in O(n), so cannot for for loop multiple all numbers but nums[i] together, need to record previous somewhere
 * solve with constant space, so cannot use HashMap which key is num[i] value is multiple res
 *
 * All above are valid solutions if no restriction
 *
 * So in another way, for a number num[i] we could multiple num[0...i-1] and num[i+1...] together and put in current
 * index i, to do this, we can multiple previous res (dp[i - 1]) * num[i - 1] into dp[i] so dp[i] will be all multiple
 * results of num[0..i-1]
 * then loop from end to start again do the same thing, dp[i] will contains multiple num[i + 1...n]
 * so finally, we got result dp[]
 *
 * Time: O(2n) = O(n)
 * Space: O(1) as (Note: The output array does not count as extra space for the purpose of space complexity analysis.)
 */

- (NSArray *)productExceptSelf: (NSArray<NSNumber *> *)nums {
    NSMutableArray<NSNumber *> *mut = [NSMutableArray new];
    [mut addObject:@1];
    for (NSInteger i = 0; i < nums.count - 1; i++) {
        [mut addObject:@(mut.lastObject.integerValue * nums[i].integerValue)];
    }
    NSInteger prod = 1;
    for (NSInteger i = nums.count - 2; i >= 0; i--) {
        prod *= nums[i + 1].integerValue;
        mut[i] = @(mut[i].integerValue * prod);
    }
    return [mut copy];
}

@end
