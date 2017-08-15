//
//  Three_Sum.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/14/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Three_Sum.h"

@implementation Three_Sum

/**
 * 15. 3Sum
 * Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note: The solution set must not contain duplicate triplets.
 
 For example, given array S = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 */

/**
 * Solution:
 * 1. Sort the array in ascending order, need to filter the duplicate number, easier to do this in sorted array
 * 2. set left index i, right index j and middle index m, outer loop of i start from 0 to last third number
 *      1. for each outer loop, start m = i + 1, j = len - 1, to find triplet number equal to 0, each step skip duplicated elements
 * 3. skip duplicated nums[i] and repeat step 2, when find triplet add to list
 *
 * Time: O(nlogn(sort) + n^2) = O(n^2) no matter how middle and right index move, they iterative all numbers right of left index once, it's O(n - 1) + O(n - 2) + ... + O(1) = O(n^2)
 * Space: O(n/3) = O(n) if all numbers could combine a triplet
 *
 */
- (NSArray *)threeSum: (NSArray *)nums {
    NSMutableArray *res = [[NSMutableArray alloc]init];
    if (nums.count < 3) return res;
    NSArray *sortedNums = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 integerValue] - [obj2 integerValue];
    }];
    NSInteger i = 0;
    while (i < sortedNums.count - 2) {
        //Define a local nums[i] to compare to skip all duplicated nums[i]
        NSInteger m = i + 1, j = sortedNums.count - 1;
        NSNumber *temp1 = sortedNums[i];
        //If left index number is larger than 0, due to sorted array, no need to compare next triplets
        if ([temp1 integerValue] > 0) break;
        while (m < j) {
            NSNumber *temp2 = sortedNums[m], *temp3 = sortedNums[j];
            NSInteger sum = temp1.integerValue + temp2.integerValue + temp3.integerValue;
            if (sum < 0) {
                while (m < j && [sortedNums[m] isEqualToNumber:temp2]) m++;
            } else if (sum > 0) {
                while (m < j && [sortedNums[j] isEqualToNumber:temp3]) j--;
            } else {
                [res addObject:[NSArray arrayWithObjects:sortedNums[i], sortedNums[m], sortedNums[j], nil]];
                while (m < j && [sortedNums[m] isEqualToNumber:temp2]) m++;
                while (m < j && [sortedNums[j] isEqualToNumber:temp3]) j--;
            }
        }
        while (i < nums.count - 2 && [nums[i] isEqualToNumber:temp1]) i++;
    }
    return [res copy];
}

@end
