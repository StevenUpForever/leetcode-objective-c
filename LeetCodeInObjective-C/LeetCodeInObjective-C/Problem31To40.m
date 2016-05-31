//
//  Problem31To40.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/28/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem31To40.h"

@implementation Problem31To40

/*
 33. Search in Rotated Sorted Array
 Suppose a sorted array is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 You are given a target value to search. If found in the array return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.
 */
- (NSInteger)search: (NSArray *)A  target: (NSNumber *)target {
    if (A.count == 0) return -1;
    NSInteger start = 0, end = A.count - 1;
    while (start <= end) {
        NSInteger middle = (start + end)/2;
        if (A[middle] == target) return middle;
        if ([A[start] integerValue] <= [A[middle] integerValue]) {
            if ([target integerValue] < [A[middle] integerValue] && [target integerValue] >= [A[start] integerValue]) {
                end = middle - 1;
            } else {
                start = middle + 1;
            }
        } else {
            if ([A[middle] integerValue] < [target integerValue] && [target integerValue] <= [A[end] integerValue]) {
                start = middle + 1;
            } else {
                end = middle - 1;
            }
        }
    }
    return -1;
}

/*
 36. Valid Sudoku
 Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.
 
 The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 
 
 A partially filled sudoku which is valid.
 
 Note:
 A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.
 */
- (BOOL)isValidSudoku: (NSArray<NSArray<NSString *> *> *)board {
    for (NSInteger i = 0; i < board.count; i++) {
        if (![self checkSudokuValid:board start1:i end1:i start2:0 end2:8] || ![self checkSudokuValid:board start1:0 end1:8 start2:i end2:i] || ![self checkSudokuValid:board start1:i/3*3 end1:i/3*3+2 start2:i%3*3 end2:i%3*3+2]) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)checkSudokuValid: (NSArray<NSArray<NSString *> *> *)board start1: (NSInteger)start1 end1: (NSInteger)end1 start2: (NSInteger)start2 end2: (NSInteger)end2 {
    NSMutableSet *set = [[NSMutableSet alloc]init];
    for (NSInteger i = start1; i <= end1; i++) {
        for (NSInteger j = start2; j <= end2; j++) {
            NSString *str = board[i][j];
            if (![str isEqualToString:@"."] && [set containsObject:str]) return NO;
        }
    }
    return YES;
}

@end
