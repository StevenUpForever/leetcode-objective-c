//
//  Regular_Expression_Matching.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/10/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Regular_Expression_Matching.h"

@implementation Regular_Expression_Matching

/**
 * 10. Regular Expression Matching
 * Implement regular expression matching with support for '.' and '*'.
 
 '.' Matches any single character.
 '*' Matches zero or more of the preceding element.
 
 The matching should cover the entire input string (not partial).
 
 The function prototype should be:
 bool isMatch(const char *s, const char *p)
 
 Some examples:
 isMatch("aa","a") → false
 isMatch("aa","aa") → true
 isMatch("aaa","aa") → false
 isMatch("aa", "a*") → true
 isMatch("aa", ".*") → true
 isMatch("ab", ".*") → true
 isMatch("aab", "c*a*b") → true
 */

/**
 *
 Solution:
 2 dimensional DP question, the sample matrix is as below:
 ""  c   *   a   *   b
 "" T   F   T   F   T   F
 a  F   F   T   T   T   F
 a  F   F   T   T   T   F
 b  F   F   T   F   T   T
 
 which M[0][0] = true, "" is matched with "", M[i][j] represent s.subString[0, i] is matched with p.subString[0, j] or not
 1. base case:
 when s is ""
 when current char is *, use pre matrix value i - 1 as current value
 otherwise is false
 when p is ""
 s is true only if when s is "" too, otherwise is false
 1.  if s[i] == p[j] || p[j] == '.', this i and j will match, dp[i][j] = dp[i - 1][j - 1]
 2.  if p[j] == '*', be aware that * represent any number of pre node, itself do not represent a character, there's multiple conditions
 1. if p[j - 1] != '.' && s[i] != p[j - 1] it means s[i] and  p[j - 1] can not match, dp[i][j] = dp[i][j - 1]
 2. else
 1. dp[i][j] = dp[i][j - 1]   a* when * is 1
 2. dp[i][j] = dp[i][j - 2]   a* when * is 0
 3. dp[i][j] = dp[i - 1][j]   a* when * is larger than 1, it's like a for loop, for every m < i, if s[m] could match at least p[j - 1], means this * works increase by 1, dp[i + 1][j] result is induction from result[i][j] if j == *
 dp[i][j] = case 1 || case 2 || case 3
 3. return the right bottom corner value of dp matrix as the result
 */
- (BOOL)isMatch: (NSString *)s p:(NSString *)p {
    NSMutableArray<NSMutableArray *> *matrix = [[NSMutableArray alloc]initWithCapacity:s.length + 1];
    for (int i = 0; i < matrix.count; i++) {
        matrix[i] = [[NSMutableArray alloc]initWithCapacity:p.length + 1];
        for (int j = 0; j < matrix[i].count; j++) {
            matrix[i][j] = @0;
        }
    }
    //When s == "" and p == "" is matched, value is true
    matrix[0][0] = @1;
    //Pre steps when s == "" but p is not "", when current p is '*', and pre value is true, current matrix value is true, otherwise false
    for (int i = 1; i < p.length; i++) {
        if ([p characterAtIndex:i] == '*' && [matrix[0][i - 1] isEqualToNumber:@1]) matrix[0][i + 1] = @1;
    }
    //i and j start from 1 to matrix length (s + 1, p + 1), no need to check matrix[i][0], it means s is not "" and p is "", all value should be false
    for (int i = 1; i <= s.length; i++) {
        for (int j = 1; j <= p.length; j++) {
            if ([s characterAtIndex:i - 1] == [p characterAtIndex:j - 1] || [p characterAtIndex:j - 1] == '.') {
                matrix[i][j] = matrix[i - 1][j - 1];
            }
            else if ([p characterAtIndex:j - 1] == '*') {
                if (j == 1) matrix[i][j] = @1;
                else if ([p characterAtIndex:j - 2] != [s characterAtIndex:i - 1] && [p characterAtIndex:j - 2] != '.')
                    matrix[i][j] = [matrix[i][j - 2] copy];
                else matrix[i][j] = [matrix[i - 1][j] integerValue] + [matrix[i][j - 1] integerValue] + [matrix[i][j - 2] integerValue] > 0 ? @1 : @0;
            }
        }
    }
    return [matrix[s.length][p.length] isEqualToNumber:@1];
}

@end
