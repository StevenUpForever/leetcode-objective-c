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
    nums = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 integerValue] > [obj2 integerValue];
    }];
    if (nums.count == 0) return nil;
    NSMutableArray *result = [[NSMutableArray alloc]init];
    NSInteger n = 1 << nums.count;
    for (NSInteger i = 0; i < n; i++) {
        NSMutableArray *combineArray = [[NSMutableArray alloc]init];
        for (NSInteger j = 0; j < nums.count; j++) {
            //Fetch the higest binary number and AND with all possible binary numbers from index of array to check if any binary number of index exist and save it in the detail array
            //找到当前可能的最高位二进制数，查找数组下标二进制数所有在这个最高位之后的，加入当前数组
            if ((i & (1<<j)) != 0) [combineArray addObject:nums[j]];
        }
        [result addObject:combineArray];
    }
    return result;
}


@end
