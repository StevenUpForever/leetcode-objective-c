//
//  Problem61To70.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 7/14/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem61To70.h"

@implementation Problem61To70

/*
 70. Climbing Stairs
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 */
- (NSInteger)climbStairs: (NSInteger)n {
    if (n < 3) {
        return n;
    }
    int result[] = {0};
    for (int i = 2; i < n; i++) {
        result[i] = result[i - 1] + result[i - 2];
    }
    return result[n - 1];
}

@end
