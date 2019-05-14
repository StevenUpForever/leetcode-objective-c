//
//  Q311SparseMatrixMultiplication.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/13/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q311SparseMatrixMultiplication.h"

@implementation Q311SparseMatrixMultiplication

//Difficulty: Medium
//TAG: Facebook
//TAG: LinkedIn
//TAG: Apple
//TAG: math

/**
 * 311. Sparse Matrix Multiplication
 * Given two sparse matrices A and B, return the result of AB.
 
 You may assume that A's column number is equal to B's row number.
 
 Example:
 
 A = [
 [ 1, 0, 0],
 [-1, 0, 3]
 ]
 
 B = [
 [ 7, 0, 0 ],
 [ 0, 0, 0 ],
 [ 0, 0, 1 ]
 ]
 
 
 |  1 0 0 |   | 7 0 0 |   |  7 0 0 |
 AB = | -1 0 3 | x | 0 0 0 | = | -7 0 3 |
 | 0 0 1 |
 */

/*
 * Solution:
 * Do a matrix multiplication,rules under https://en.wikipedia.org/wiki/Matrix_multiplication
 * Diff is due to every number in A need to multiple by all the row in B, so if A[i][j] is 0, skip the inner loop due to all numbers sum will be 0 too, Sparse Matrix will have most of 0 values which will save the time
 *
 * m represent row of A, n represent col of A, i represent row of B, j represent col of B
 * Time: O(mnj)
 * Space: O(mj)
 */

- (NSArray *)multiply: (NSArray<NSArray<NSNumber *> *> *) A : (NSArray<NSArray<NSNumber *> *> *) B {
    NSMutableArray<NSMutableArray<NSNumber *> *> *res = [NSMutableArray new];
    for (NSInteger i = 0; i < A.count; i++) {
        NSMutableArray<NSNumber *> *arr = [NSMutableArray new];
        for (NSInteger j = 0; j < B[0].count; j++) {
            [arr addObject:@0];
        }
        [res addObject:arr];
    }
    for (NSInteger i = 0; i < A.count; i++) {
        for (NSInteger j = 0; j < A[i].count; j++) {
            if (![A[i][j] isEqualToNumber:@0]) {
                for (NSInteger k = 0; k < B[0].count; k++) {
                    res[i][k] = @(A[i][j].integerValue * B[j][k].integerValue);
                }
            }
        }
    }
    return res;
}

@end
