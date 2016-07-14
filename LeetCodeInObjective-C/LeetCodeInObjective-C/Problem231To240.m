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
