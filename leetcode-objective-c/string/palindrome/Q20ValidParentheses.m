//
//  Valid_Parentheses.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/17/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Q20ValidParentheses.h"

@implementation Q20ValidParentheses

//TAG: Google
//TAG: Facebook
//TAG: Microsoft
//TAG: Amazon
//TAG: Apple
//TAG: Stack
//Difficulty: Easy

/**
 * 20. Valid Parentheses
 * Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 */

/*
 * Solution:
 * Use stack to save the parenthesis
 * 1. When met left side parenthesis, push into stack
 * 2. when met right side parenthesis, depends on the feature of parentheses and stack, need to review the most recent (peek in stack) to see if could be a pair, if so, delete the peek, otherwise is invalid parentheses
 * 3. at last to see if stack is empty and s.length() is empty, if any one is not, means over more left side (s is empty) or more right side (stack is empty) return false
 */

- (BOOL)isValid: (NSString *)s {
    if (s.length == 0) return true;
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i < s.length; i++) {
        char c = [s characterAtIndex:i];
        if (c == '(' || c == '[' || c == '{') {
            [arr addObject: [NSString stringWithFormat:@"%c", c]];
        } else if (arr.count > 0 && ((c == ')' && [arr.lastObject isEqualToString:@"("])
                                     || (c == ']' && [arr.lastObject isEqualToString:@"["])
                                     || (c == '}' && [arr.lastObject isEqualToString:@"{"]))) {
            [arr removeLastObject];
        } else return false;
    }
    return arr.count == 0;
}

@end
