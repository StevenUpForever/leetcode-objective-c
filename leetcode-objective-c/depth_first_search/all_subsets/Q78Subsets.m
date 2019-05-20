//
//  Q78Subsets.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q78Subsets.h"

@implementation Q78Subsets

//TAG: Facebook
//TAG: Amazon
//TAG: Uber
//TAG: Apple
//TAG: DFS
//Difficulty: Medium

/**
 * 78. Subsets
 * Given a set of distinct integers, nums, return all possible subsets.
 
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

/*
 * Solution:
 * dfs
 * Base case: if recursion index == nums.length, add copy of list to result list
 * recursion rule: for a recursion tree, each level has two status, add the number or not, so we have the recursion tree as below:
 *              ""
 *             /  \
 *            1   ""
 *           / \ / \
 *         12  1 2  ""
 *         ......
 *
 * Time: O(2^n) n is length of nums
 * Space: O(2^n) numbers of possible subsets
 */

- (NSArray *)subsets: (NSArray<NSNumber *> *) nums {
    NSMutableArray *arr = [NSMutableArray new];
    [self dfs:arr curArr:[NSMutableArray new] nums:nums index:0];
    return [arr copy];
}

- (void)dfs: (NSMutableArray *)arr curArr: (NSMutableArray<NSNumber *> *)curArr
       nums: (NSArray<NSNumber *> *) nums
      index: (NSInteger)index {
    if (index >= nums.count) {
        [arr addObject:[curArr copy]];
        return;
    }
    [curArr addObject:nums[index]];
    [self dfs:arr curArr:curArr nums:nums index:index + 1];
    [curArr removeLastObject];
    [self dfs:arr curArr:curArr nums:nums index:index + 1];
}

@end
