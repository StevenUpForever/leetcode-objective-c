//
//  Problem211To220.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 7/15/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem211To220.h"
#import "Sort.h"

@implementation Problem211To220

/*
 215. Kth Largest Element in an Array
 Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
 
 For example,
 Given [3,2,1,5,6,4] and k = 2, return 5.
 
 Note:
 You may assume k is always valid, 1 ≤ k ≤ array's length.
 */
- (NSNumber *)findKthLargest: (NSArray *)nums andK: (NSInteger)k {
    if (nums.count == 0) {
        return 0;
    }
    Sort *sort = [[Sort alloc]init];
    [sort quickSortTwo:nums];
    return nums[k - 1];
}

@end
