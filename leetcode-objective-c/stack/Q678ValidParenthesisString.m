//
//  Q678ValidParenthesisString.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q678ValidParenthesisString.h"

@implementation Q678ValidParenthesisString

//Difficulty: medium
//TAG: Facebook
//TAG: stack

/**
 * 678. Valid Parenthesis String
 * Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:
 *
 * Any left parenthesis '(' must have a corresponding right parenthesis ')'.
 * Any right parenthesis ')' must have a corresponding left parenthesis '('.
 * Left parenthesis '(' must go before the corresponding right parenthesis ')'.
 * '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
 * An empty string is also valid.
 * Example 1:
 * Input: "()"
 * Output: True
 * Example 2:
 * Input: "(*)"
 * Output: True
 * Example 3:
 * Input: "(*))"
 * Output: True
 * Note:
 * The string size will be in the range [1, 100].
 */

/*
 Solution:
 
 count star in the string,
 when ) over (, check if we have any stars, if so, decrease one star, if not return false
 other wise pop a (
 
 finally need check ( stack and * stack, due to if something happen like ***((( this will not be a right case
 
 Time: O(n)
 Space: O(n)
 */

- (BOOL)checkValidString: (NSString *)s {
    NSMutableArray<NSNumber *> *stack = [NSMutableArray new],
    *starStack = [NSMutableArray new];
    for (NSInteger i = 0; i < s.length; i++) {
        char c = [s characterAtIndex:i];
        if (c == '(') [stack addObject:@(i)];
        else if (c == '*') [starStack addObject:@(i)];
        else {
            if (stack.count == 0) {
                if (starStack.count > 0) [starStack removeLastObject];
                else return NO;
            } else [stack removeLastObject];
        }
    }
    while (stack.count > 0 && starStack.count > 0) {
        if ([stack.lastObject compare:starStack.lastObject] == NSOrderedDescending) return NO;
        [stack removeLastObject];
        [starStack removeLastObject];
    }
    return stack.count == 0;
}

@end
