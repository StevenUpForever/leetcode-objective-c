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
    NSMutableArray *res = [[NSMutableArray alloc]init];
    if (nums.count < 4) return [res copy];
    NSArray *sortedNums = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 integerValue] - [obj2 integerValue];
    }];
    NSInteger i = 0;
    while (i < sortedNums.count - 3) {
        NSInteger m = i + 1, j = sortedNums.count - 1;
        NSNumber *temp1 = sortedNums[i];
        //Leave space for midR
        while (m + 1 < j) {
            NSNumber *temp2 = sortedNums[j];
            NSInteger midL = m, midR = j - 1;
            while (midL < midR) {
                NSNumber *temp3 = sortedNums[midL], *temp4 = sortedNums[midR];
                NSInteger sum = temp1.integerValue + temp2.integerValue + temp3.integerValue + temp4.integerValue;
                if (sum < target) {
                    while (midL < midR && [sortedNums[midL] isEqualToNumber:temp3]) midL++;
                } else if (sum > target) {
                    while (midL < midR && [sortedNums[midR] isEqualToNumber:temp4]) midR--;
                } else {
                    [res addObject:[NSArray arrayWithObjects:temp1, temp2, temp3, temp4, nil]];
                    while (midL < midR && [sortedNums[midL] isEqualToNumber:temp3]) midL++;
                    while (midL < midR && [sortedNums[midR] isEqualToNumber:temp4]) midR--;
                }
            }
            while (m + 1 < j && [sortedNums[j] isEqualToNumber:temp2]) j--;
        }
        while (i < sortedNums.count - 3 && [nums[i] isEqualToNumber:temp1]) i++;
    }
    return [res copy];
}

@end
