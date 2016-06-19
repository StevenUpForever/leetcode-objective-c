//
//  Problem71To80.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 6/8/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem71To80.h"

@implementation Problem71To80


/*
 78. Subsets
 Given a set of distinct integers, nums, return all possible subsets.
 
 Note: The solution set must not contain duplicate subsets.
 
 For example,
 If nums = [1,2,3], a solution is:
 
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 */
- (NSArray *)subsets: (NSArray *)nums {
    int len = 1 << nums.count;
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for (int i = 0; i < len; i++) {
        NSMutableArray *subset = [[NSMutableArray alloc]init];
        for (int j = 0; j < nums.count; j++) {
            if (i & ((1 << j) != 0)) {
                [subset addObject:nums[j]];
            }
        }
        [result addObject:subset];
    }
    return result;
}


@end
