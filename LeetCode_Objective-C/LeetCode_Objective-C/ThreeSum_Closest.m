//
//  ThreeSum_Closest.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/17/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "ThreeSum_Closest.h"

@implementation ThreeSum_Closest

/**
 * 16. 3Sum Closest
 * Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
 
 For example, given array S = {-1 2 1 -4}, and target = 1.
 
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 */

/**
 * Solution:
 * Similar as 3sum, difference is keep a global min sum when equal to number immediately return this number
 *
 * Time: O(nlogn(sort) + n^2) = O(n^2) no matter how middle and right index move, they iterative all numbers right of left index once, it's O(n - 1) + O(n - 2) + ... + O(1) = O(n^2)
 * Space: O(1)
 */
- (NSInteger)threeSumClosest: (NSArray *)nums target: (NSInteger)target {
    if (nums.count < 3) return 0;
    NSArray *sortedNums = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 integerValue] - [obj2 integerValue];
    }];
    NSInteger i = 0, res = 0, diff = NSIntegerMax;
    while (i < sortedNums.count - 2) {
        //Define a local nums[i] to compare to skip all duplicated nums[i]
        NSInteger m = i + 1, j = sortedNums.count - 1;
        NSNumber *temp1 = sortedNums[i];
        //If left index number is larger than 0, due to sorted array, no need to compare next triplets
        if ([temp1 integerValue] > 0) break;
        while (m < j) {
            NSNumber *temp2 = sortedNums[m], *temp3 = sortedNums[j];
            NSInteger sum = temp1.integerValue + temp2.integerValue + temp3.integerValue;
            if (diff > ABS(target - sum)) {
                diff = ABS(target - sum);
                res = sum;
            }
            if (sum < target) {
                while (m < j && [sortedNums[m] isEqualToNumber:temp2]) m++;
            } else if (sum > target) {
                while (m < j && [sortedNums[j] isEqualToNumber:temp3]) j--;
                //If equal to target, the best answer is the target, no need to consider result of triplets even there's other number equal to this
            } else return target;
        }
        while (i < nums.count - 2 && [nums[i] isEqualToNumber:temp1]) i++;
    }
    return res;
}

@end
