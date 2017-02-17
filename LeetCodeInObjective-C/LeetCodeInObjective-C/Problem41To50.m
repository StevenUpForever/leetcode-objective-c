//
//  Problem41To50.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/30/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem41To50.h"

@implementation Problem41To50

/*
 44. Wildcard Matching
 Implement wildcard pattern matching with support for '?' and '*'.
 
 '?' Matches any single character.
 '*' Matches any sequence of characters (including the empty sequence).
 
 The matching should cover the entire input string (not partial).
 
 The function prototype should be:
 bool isMatch(const char *s, const char *p)
 
 Some examples:
 isMatch("aa","a") → false
 isMatch("aa","aa") → true
 isMatch("aaa","aa") → false
 isMatch("aa", "*") → true
 isMatch("aa", "a*") → true
 isMatch("ab", "?*") → true
 isMatch("aab", "c*a*b") → false
 
 Approach: Use 2 dimensional DP, depends on the rules of the problem, we know that:
 Base case M[0][0] = True, means "" and "" matchs
 Induction rule: M[i][j] indicate the s.subString(0, i) and p.subString(0, j) is matched or not
 Three rules:
 if p[j] == '?' || s[i] == p[j] M[i][j] = M[i - 1][j - 1]
 if p[j] == '*'  M[i][j] = M[i][j - 1] || M[i - 1][j] '*' matchs one random chacter
 else if not fit above conditions, M[i][j] = false
    "" a  ?  b  *  c
 "" T  F  F  F  T  F
 a  F  T  F  F  T  F
 a  F  F  T  F  T  F
 b  F  F  F  T  T  F
 d  F  F  F  F  T  F
 e  F  F  F  F  T  F
 c  F  F  F  F  T  T
 So "aabdec" & "a?b*c" is matched
 */
- (BOOL)isMatch: (NSString *)s andP: (NSString *)p {
    NSMutableArray<NSMutableArray *> *arrs = [[NSMutableArray alloc]init];
    arrs[0][0] = [NSNumber numberWithBool:YES];
    for (int i = 1; i <= p.length; i++) {
        char cur = [p characterAtIndex:i];
        BOOL valid = cur == '*' ? YES : NO;
        [arrs[0] addObject:[NSNumber numberWithBool: valid]];
    }
    for (int j = 1; j <= s.length; j++) {
        arrs[j][0] = [NSNumber numberWithBool:NO];
    }
    for (int i = 1; i <= p.length; i++) {
        for (int j = 1; j <= s.length; j++) {
            char charP = [p characterAtIndex:i];
            char charS = [s characterAtIndex:j];
            if (charP == charS || charP == '?') {
                arrs[i][j] = arrs[i - 1][j - 1];
            } else if (charP == '*') {
                arrs[i][j] = [NSNumber numberWithBool:[arrs[i - 1][j] boolValue] || [arrs[i - 1][j] boolValue]];
            } else {
                arrs[i][j] = [NSNumber numberWithBool:NO];
            }
        }
    }
    return [arrs[s.length][p.length] boolValue];
}

/*
 49. Group Anagrams
 Given an array of strings, group anagrams together.
 
 For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Return:
 
 [
 ["ate", "eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 Note:
 For the return value, each inner list's elements must follow the lexicographic order.
 All inputs will be in lower-case.
 */
- (NSArray<NSArray<NSString *> *> *)groupAnagrams: (NSArray<NSString *> *)strs {
    if (strs.count == 0) return nil;
    strs = [strs sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *dict = [[NSMutableDictionary alloc]init];
    for (NSString *str in strs) {
        unichar *buffer = (unichar *)malloc(sizeof(unichar) * str.length);
        [str getCharacters:buffer];
        qsort_b(buffer, str.length, sizeof(unichar), ^int(const void *a, const void *b) {
            unichar m = *(unichar *)a;
            unichar n = *(unichar *)b;
            return m - n;
        });
        NSString *keyStr = [NSString stringWithCharacters:buffer length:str.length];
        free(buffer);
        if ([dict.allKeys containsObject:keyStr]) {
            [dict[keyStr] addObject:str];
        } else {
            [dict setObject:[NSMutableArray arrayWithObjects:str, nil] forKey:keyStr];
        }
    }
    return dict.allValues;
}

@end
