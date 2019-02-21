//
//  Q139WordBreak.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q139WordBreak.h"

@implementation Q139WordBreak

//TAG: Google
//TAG: Facebook
//TAG: Amazon
//TAG: Uber
//TAG: Snap
//TAG: Apple
//TAG: DP
//Difficulty: Medium

/**
 * 139. Word Break
 * Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words. You may assume the dictionary does not contain duplicate words.
 
 For example, given
 s = "leetcode",
 dict = ["leet", "code"].
 
 Return true because "leetcode" can be segmented as "leet code".
 
 UPDATE (2017/1/4):
 The wordDict parameter had been changed to a list of strings (instead of a set of strings). Please reload the code definition to get the latest changes.
 */

/*
 * Solution:
 *
 * 1 d dp, base case dp[0] = false, which "" cannot segmented from words in dict
 * induction rule: dp[i] represent s.substring(0, i) could be segmented from words in dict, which steps follow:
 *  1. if wordDict contains s.substring(0, i) dp[i] = true
 *  2. else loop j from 0 to i - 1, if dp[j] = true, means s.subString(0, j) in dict, and
 *  wordDict contains(s.substring(j + 1, i)), dp[i] = true, s.substring(0, i) canbe segmented into (0, j) + (j + 1, i)
 *  return dp[len - 1]
 *
 *  Time: O(n^2)
 *  Space: O(n)
 */

- (BOOL)wordBreak: (NSString *)s wordDict: (NSArray<NSString *> *)wordDict {
    if (!s && !wordDict) return YES;
    if (!s || !wordDict) return NO;
    NSSet *set = [NSSet setWithArray:wordDict];
    int dp[sizeof(s)] = {};
    for (NSInteger i = 0; i < s.length; i++) {
        if ([set containsObject:[s substringToIndex:i + 1]]) {
            dp[i] = 1;
        } else {
            for (NSInteger j = 0; j < i; j++) {
                if (dp[j] == 1 && [set containsObject:[s substringWithRange:NSMakeRange(j + 1, i - j)]]) {
                    dp[i] = 1;
                    break;
                }
            }
        }
    }
    return dp[s.length - 1] == 1;
}

@end
