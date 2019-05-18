//
//  Q282ExpressionAddOperators.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q282ExpressionAddOperators.h"

@implementation Q282ExpressionAddOperators

//TAG: Google
//TAG: Facebook
//TAG: Apple
//TAG: DFS
//Difficulty: Hard

/**
 * 282. Expression Add Operators
 * Given a string that contains only digits 0-9 and a target value, return all possibilities to add binary operators (not unary) +, -, or * between the digits so they evaluate to the target value.
 *
 * Examples:
 * "123", 6 -> ["1+2+3", "1*2*3"]
 * "232", 8 -> ["2*3+2", "2+3*2"]
 * "105", 5 -> ["1*0+5","10-5"]
 * "00", 0 -> ["0+0", "0-0", "0*0"]
 * "3456237490", 9191 -> []
 */

/*
 Solution:
 DFS
 base case: if index == num.length(), return, and only if current value == target, add to list
 recursion rule:
 loop num, parse diff digits number and recursion + - * to next level
 key point here is save current multiple number, for next possible multiple reorder calculation
 e.g. 1+2*3, first already did 1 + 2, but need do 2*3 first, then could do 1 + 2 - 2(saved) + 2 (saved) * 3
 
 Time: O(n^n)
 Space: O(n)
 */

- (NSArray<NSString *> *)addOperators: (NSString *)num target: (NSInteger)target {
    NSMutableArray<NSString *> *mut = [NSMutableArray new];
    [self dfs:num index:0 strs:mut curStr:@"" curSum:0 target:target preVal:0];
    return [mut copy];
}

- (void)dfs: (NSString *)num index: (NSInteger)index
       strs: (NSMutableArray<NSString *> *)strs
     curStr: (NSString *)curStr
     curSum: (NSInteger)curSum
     target: (NSInteger)target
     preVal: (NSInteger)preVal {
    if (index == num.length) {
        if (curSum == target) {
            [strs addObject:curStr];
        }
        return;
    }
    for (NSInteger i = index; i < num.length; i++) {
        NSString *sub = [num substringWithRange: NSMakeRange(index, i - index + 1)];
        if (index == 0) {
            [self dfs:num index:i + 1 strs:strs curStr:sub curSum:sub.integerValue target:target preVal:sub.integerValue];
        } else {
            [self dfs:num index:i + 1 strs:strs curStr:[NSString stringWithFormat:@"%@+%@", curStr, sub] curSum:curSum + sub.integerValue target:target preVal:sub.integerValue];
            [self dfs:num index:i + 1 strs:strs curStr:[NSString stringWithFormat:@"%@-%@", curStr, sub] curSum:curSum - sub.integerValue target:target preVal: sub.integerValue];
            [self dfs:num index:i + 1 strs:strs curStr:[NSString stringWithFormat:@"%@*%@", curStr, sub] curSum:curSum - preVal + sub.integerValue * preVal target:target preVal:sub.integerValue * preVal];
        }
        if ([sub isEqualToString:@"0"]) break;
    }
}

@end
