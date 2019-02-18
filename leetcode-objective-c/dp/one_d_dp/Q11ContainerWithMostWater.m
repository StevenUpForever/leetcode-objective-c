//
//  Container_With_Most_Water.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/14/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Q11ContainerWithMostWater.h"

@implementation Q11ContainerWithMostWater

//Difficulty: Hard
//TAG: Uber
//TAG: Apple
//TAG: DP

/**
 * 11. Container With Most Water
 * Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
 
 Note: You may not slant the container and n is at least 2.
 */

/*
 * Solution 1:
 * 1. base case, when array count is less than 2, no water could be contained, return 0
 * 2. keep global max, two for loops
 *      1. water = abs(j - i) * min(i, j)
 *      2. res = max(water, water)
 *
 * Time: O(n^2)
 * Space: O(1)
 */

- (NSInteger)maxAreaS1: (NSArray *)height {
    NSInteger max = 0;
    for (int i = 0; i < height.count - 1; i++) {
        for (int j = 1; j < height.count; j++) {
            NSInteger cur = (j - i) * MIN([height[i] integerValue], [height[j] integerValue]);
            max = MAX(max, cur);
        }
    }
    return max;
}

/*
 * Solution 2:
 * 1. base case, when array count is less than 2, no water could be contained, return 0
 * 2. one loop to find the larger side of two sides, move left and right index to middle
 *      1. first set i = 0, j = len - 1, which currently the bottom is the largest, no matter how loop goes, the bottom is decrease by 1 each time
 *      2. About the current height, we want to keep the max number of water, so we skip the current min(height[i], height[j]), move the smaller value within i, j, although don't other values in middle part, but just consider about current known scope, so this is a dp problem
 *      3. keep a global max of current value
 *
 * TIme: O(n)
 * Space: O(1)
 */

- (NSInteger)maxAreaS2: (NSArray *)height {
    NSInteger max = 0, i = 0, j = height.count - 1;
    while (i < j) {
        NSInteger cur = (j - i) * MIN([height[i] integerValue], [height[j] integerValue]);
        max = MAX(max, cur);
        //Keep the current larger height and goto next larger problem
        if ([height[i] integerValue] < [height[j] integerValue]) i++;
        else j--;
    }
    return max;
}


@end
