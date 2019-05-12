//
//  Q301RemoveInvalidParentheses.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/11/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q301RemoveInvalidParentheses.h"

@implementation Q301RemoveInvalidParentheses

//TAG: Facebook
//TAG: DFS
//TAG: BFS
//Difficulty: Hard

/**
 * 301. Remove Invalid Parentheses
 * Remove the minimum number of invalid parentheses in order to make the input string valid. Return all possible results.
 
 Note: The input string may contain letters other than the parentheses ( and ).
 
 Examples:
 "()())()" -> ["()()()", "(())()"]
 "(a)())()" -> ["(a)()()", "(a())()"]
 ")(" -> [""]
 Credits:
 Special thanks to @hpplayer for adding this problem and creating all test cases.
 */

/*
Solution 2: BFS

similar as find min steps, modify any characters in string and add to queue

Time: O(n^n)
Space: O(n)
*/

- (NSArray<NSString *> *)removeInvalidParentheses: (NSString *)s {
    NSMutableArray<NSString *> *res = [NSMutableArray new];
    if (!s) return res;
    NSMutableArray<NSString *> *queue = [NSMutableArray new];
    NSMutableSet<NSString *> *set = [NSMutableSet new];
    [queue addObject:s];
    [set addObject:s];
    while (queue.count > 0) {
        NSInteger count = queue.count;
        while (count-- > 0) {
            NSString *poll = queue.firstObject;
            [queue removeObjectAtIndex:0];
            if ([self validParentheses:poll]) [res addObject:poll];
            for (NSInteger i = 0; i < poll.length; i++) {
                NSMutableString *mut = [poll mutableCopy];
                [mut deleteCharactersInRange:NSMakeRange(i, 1)];
                NSString *newStr = [mut copy];
                if (![set containsObject:newStr]) {
                    [set addObject:newStr];
                    [queue addObject:newStr];
                }
            }
        }
        if (res.count > 0) break;
    }
    return res;
}

- (BOOL)validParentheses: (NSString *)str {
    NSInteger count = 0;
    for (NSInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        if (c == '(') count++;
        else if (c == ')') count--;
        if (count < 0) return NO;
    }
    return count == 0;
}

@end
