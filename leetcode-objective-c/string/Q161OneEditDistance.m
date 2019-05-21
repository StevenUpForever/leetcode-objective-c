//
//  Q161OneEditDistance.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q161OneEditDistance.h"

@implementation Q161OneEditDistance

//TAG: Facebook
//TAG: Uber
//TAG: String
//Difficulty: Medium

/**
 * 161. One Edit Distance
 * Given two strings S and T, determine if they are both one edit distance apart.
 * Note:
 *
 * There are 3 possiblities to satisify one edit distance apart:
 *
 * Insert a character into s to get t
 * Delete a character from s to get t
 * Replace a character of s to get t
 * Example 1:
 *
 * Input: s = "ab", t = "acb"
 * Output: true
 * Explanation: We can insert 'c' into s to get t.
 * Example 2:
 *
 * Input: s = "cab", t = "ad"
 * Output: false
 * Explanation: We cannot get t from s by only one step.
 * Example 3:
 *
 * Input: s = "1203", t = "1213"
 * Output: true
 * Explanation: We can replace '0' with '1' to get t.
 */

/*
 * Solution:
 * Just check if could edit once, so loop the string, when find 1 char different:
 *      if length is the same, that means current diff char need be replaced,
 *      compare s.substring(i + 1) and t.substring(i + 1)
 *      if length is different, check small.substring(i) with large.substring(i + 1)
 *
 * Time: O(min(s, t))
 * Space: O(1)
 */

- (BOOL)isOneEditDistance: (NSString *)s t: (NSString *)t {
    for (NSInteger i = 0; i < MIN(s.length, t.length); i++) {
        char c1 = [s characterAtIndex:i], c2 = [t characterAtIndex:i];
        if (c1 != c2) {
            if (s.length == t.length) return [[s substringFromIndex:i + 1] isEqualToString:[t substringFromIndex:i + 1]];
            else return s.length < t.length ?
                [[s substringFromIndex:i] isEqualToString:[t substringFromIndex:i + 1]] :
                [[s substringFromIndex:i + 1] isEqualToString:[t substringFromIndex:i]];
        }
    }
    return ABS(s.length - t.length) <= 1;
}

@end
