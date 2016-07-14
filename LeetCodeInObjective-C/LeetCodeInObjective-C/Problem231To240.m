//
//  Problem231To240.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 6/3/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem231To240.h"
#import "ListNode.h"

@implementation Problem231To240

/*
 237. Delete Node in a Linked List
 Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.
 
 Supposed the linked list is 1 -> 2 -> 3 -> 4 and you are given the third node with value 3, the linked list should become 1 -> 2 -> 4 after calling your function.
 */
- (void)deleteNode: (ListNode *)node {
    if (node == nil) {
        return;
    }
    while (node.next != nil) {
        node.val = node.next.val;
        if (node.next.next == nil) {
            node.next = nil;
        } else {
            node = node.next;
        }
    }
}

/*
 238. Product of Array Except Self
 Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 Solve it without division and in O(n).
 
 For example, given [1,2,3,4], return [24,12,8,6].
 
 Follow up:
 Could you solve it with constant space complexity? (Note: The output array does not count as extra space for the purpose of space complexity analysis.)
 */

//Best Solution from LeetCode discussion
- (NSArray *)productExceptSelf: (NSArray *)nums {
    NSInteger len = nums.count;
    NSMutableArray *result = [[NSMutableArray alloc]init];
    [result addObject:@1];
    for (NSInteger index = 1; index < len; index++) {
        [result addObject:[NSNumber numberWithInteger:[result[index - 1] integerValue] * [nums[index - 1] integerValue]]];
    }
    NSInteger tag = 1;
    for (NSInteger index = len - 1; index >= 0; index--) {
        result[index] = [NSNumber numberWithInteger:tag * [result[index] integerValue]];
        tag *= [nums[index] integerValue];
    }
    return [result copy];
}

/*
 240. Search a 2D Matrix II
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
 
 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
 For example,
 
 Consider the following matrix:
 
 [
 [1,   4,  7, 11, 15],
 [2,   5,  8, 12, 19],
 [3,   6,  9, 16, 22],
 [10, 13, 14, 17, 24],
 [18, 21, 23, 26, 30]
 ]
 Given target = 5, return true.
 
 Given target = 20, return false.
 */
- (BOOL)searchMatrix: (NSArray<NSArray *> *)matrix target: (NSNumber *)target {
    if (matrix.count == 0) return NO;
    NSInteger m = 0, n = matrix[0].count - 1;
    while (m < matrix.count && n >= 0) {
        NSNumber *temp = matrix[m][n];
        if (temp == target) return YES;
        else if (temp < target) m++;
        else n--;
    }
    return NO;
}

@end
