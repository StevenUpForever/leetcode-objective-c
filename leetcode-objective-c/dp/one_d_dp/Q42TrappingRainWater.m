//
//  Q42TrappingRainWater.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/13/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q42TrappingRainWater.h"

@implementation Q42TrappingRainWater

//TAG: Google
//TAG: Facebook
//TAG: Uber
//TAG: Airbnb
//TAG: Apple
//TAG: DP
//Difficulty: Hard

/**
 * 42. Trapping Rain Water
 * Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
 
 For example,
 Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.
 */

/*
 * Solution:
 * DP problem, as the max watter trapped is determined by the shorter side of left and right side
 * 1. define the left side (0) and right side (len - 1)
 * 2. DP rules:
 *      Base case: M[0] = 0, as no matter what is the height of left and right, but cannot trap any water on them
 *      Induction rule: for each index, the water is determined by shorter one of left and right, so keep leftMax and rightMax
 *              1. if leftMax < rightMax, res +=  max(0, leftMax - height[left]), leftMax = max(leftMax, height[left])
 *              2. if leftMax > rightMax, res +=  max(0, rightMax - height[right]), rightMax = max(rightMax, height[right])
 *
 * Time: O(n)
 * Space: O(1)
 */

- (NSInteger)trap: (NSArray<NSNumber *> *)height {
    NSInteger left = 0, right = height.count - 1, res = 0,
    lMax = height[left].integerValue, rMax = height[right].integerValue;
    while (left < right) {
        if ([height[left] compare:height[right]] == NSOrderedAscending) {
            res += MAX(0, lMax - height[left].integerValue);
            rMax = MAX(rMax, height[left].integerValue);
            left++;
        } else {
            res += MAX(0, rMax - height[right].integerValue);
            rMax = MAX(rMax, height[right].integerValue);
            right--;
        }
    }
    return res;
}

@end
