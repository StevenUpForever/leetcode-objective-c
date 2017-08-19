//
//  Generate_Parentheses.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/18/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Generate_Parentheses.h"

@implementation Generate_Parentheses

/**
 * 22. Generate Parentheses
 * Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 */

/**
 * Solution:
 * Permutations/subsets better use recursion
 * for example, when n == 3, the recursion tree is as below
 *              ""
 *             /  \
 *            (   not valid
 *           / \
 *          (   ) (0 '(' left)
 *         / \
 *        (  ) (1 '(' left)
 *       /  / \
 *      (  (  ) (0 '(' left)
 *     /
 *    )
 *   /
 *  )       ......
 * /
 *)
 * Base case: when number of added '(' and ')' is n * 2, add current parentheses string
 * Recursion rule:
 * 1. 1st recursion no matter how many the ( and ) is, if ( is less than n, add (
 * 2. 2st recursion only if ) is less than ( (of course less than n too), add )
 *
 * Time: O(2^n)
 * Space: O(2n) = O(n) most recursion steps, to combine one string as 2n length
 */
- (NSArray *)generateParenthesis: (NSInteger)n {
    NSMutableArray *res = [[NSMutableArray alloc]init];
    [self generateParenthesisHelper:res n:n left:0 right:0 str:[[NSMutableString alloc]init]];
    return [res copy];
}

- (void)generateParenthesisHelper: (NSMutableArray *)res n: (NSInteger)n left: (NSInteger)left right: (NSInteger)right str: (NSMutableString *)str {
    if (left + right == 2 * n) {
        [res addObject:[str copy]];
        return;
    }
    //Remember to reset current build status to previous node when fall back to upper node and go to right subtree
    if (left < n) {
        [str appendString:@"("];
        [self generateParenthesisHelper:res n:n left:left + 1 right:right str:str];
        [str deleteCharactersInRange:NSMakeRange(str.length - 1, 1)];
    }
    if (right < left) {
        [str appendString:@")"];
        [self generateParenthesisHelper:res n:n left:left right:right + 1 str:str];
        [str deleteCharactersInRange:NSMakeRange(str.length - 1, 1)];
    }
}

@end
