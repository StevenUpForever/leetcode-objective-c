//
//  FourSum.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/14/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "FourSum.h"

@implementation FourSum

/**
 * 18. 4Sum
 * Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
 
 Note: The solution set must not contain duplicate quadruplets.
 
 For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.
 
 A solution set is:
 [
 [-1,  0, 0, 1],
 [-2, -1, 1, 2],
 [-2,  0, 0, 2]
 ]
 */

/**
 * Solution:
 * Similar as 3 sum, after sort the array, treat middle left and right index pair as the third number of 3sum (middle index)
 *
 * Time: O(nlogn(sort) + n^3) = O(n^3)
 */
- (NSArray *)fourSum: (NSArray *)nums target: (NSInteger)target {
    
}

@end
