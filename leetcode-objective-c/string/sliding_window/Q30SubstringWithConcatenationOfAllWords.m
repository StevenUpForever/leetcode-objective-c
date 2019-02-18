//
//  Substring_with_Concatenation_of_All_Words.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/21/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Q30SubstringWithConcatenationOfAllWords.h"

@implementation Q30SubstringWithConcatenationOfAllWords

//Difficulty: Hard
//TAG: Apple
//TAG: String
//TAG: sliding window

/**
 * 30. Substring with Concatenation of All Words
 * You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.
 
 For example, given:
 s: "barfoothefoobarman"
 words: ["foo", "bar"]
 
 You should return the indices: [0,9].
 (order does not matter).
 */

/*
 * Solution:
 * Key point is all words in words array are of the same length
 * Similar as find anagram in string, treat word in words as one character (due to same length)
 * define two index, which the left is left index of the first word in the window, right is the left index of the last word in the window, have a hashMap to record the frequency
 *
 * Time: O(n) n represent the length of s
 * Space: O(m) m represent the length of words
 */

- (NSArray *)findSubstringS1: (NSString *)s words: (NSArray<NSString *> *)words {
    NSMutableArray *res = [[NSMutableArray alloc]init];
    if (words.count == 0) return [res copy];
    NSInteger sigLen = words[0].length;
    NSInteger totalLen = sigLen * words.count;
    if (totalLen > s.length) return [res copy];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    for (NSString *word in words) {
        if (!dict[word]) dict[word] = @1;
        else {
            NSNumber *cur = dict[word];
            dict[word] = [NSNumber numberWithInteger:[cur integerValue] + 1];
        }
    }
    NSInteger count = 0;
    for (NSInteger i = 0; i <= s.length - sigLen; i += sigLen) {
        NSString *cur = [s substringWithRange:NSMakeRange(i, sigLen)];
        NSNumber *curNum = dict[cur];
        if (curNum.integerValue > 0) {
            dict[cur] = [NSNumber numberWithInteger:curNum.integerValue - 1];
            if (curNum.integerValue == 1) count++;
        }
        //Delete dict record of visited strings when i is over total length in s
        if (i >= totalLen) {
            NSString *delStr = [s substringWithRange:NSMakeRange(i - totalLen, i - totalLen + sigLen)];
            NSNumber *upNum = dict[delStr];
            if (upNum) {
                dict[delStr] = [NSNumber numberWithInteger:upNum.integerValue + 1];
                if (upNum.integerValue == 0) count--;
            }
        }
        if (count == dict.allKeys.count) [res addObject:[NSNumber numberWithInteger:i - totalLen + sigLen]];
    }
    return [res copy];
}

/*
 * Solution:
 * Sliding window & valid concat DP problem
 * First, valid substring.length == sum of length in words array, so we set a window start from 0 length with this totalLength
 * for each time the sliding window move right by 1, run a concat validation helper function (dynamic programming) to validate current window, and if so, add current start index to result array
 *
 * Time: O(n^2) when dp algorithm length is s.length is the worst case, n represent the length of s
 * Space: O(n) dp array used every time, largest is the s.length
 */

- (NSArray *)findSubstringS2: (NSString *)s words: (NSArray<NSString *> *)words {
    NSMutableArray *res = [[NSMutableArray alloc]init];
    if (res.count == 0) return [res copy];
    NSInteger len = 0;
    for (NSString *str in words) len += str.length;
    if (len > s.length) return [res copy];
    NSInteger l = 0, r = len - 1;
    while (r < s.length) {
        if ([self validConcat2:s l:l r:r words:words]) [res addObject:[NSNumber numberWithInteger:l]];
    }
    return [res copy];
}

/*
 * DP algorithm to validate current substring could be concat with words in array or not
 * Base case: M[0] = false, "" cannot concat from strings in words array (except the empty words array)
 * Induction rule:
 *      if words.contains(s[l, r]) ||
 *             for (i in l...r) (dp[i] && words.contains[s[i...r]) dp[i] = true
 * return the last boolean of dp array
 *
 * Time: O(n^2) n represent the current part length from l to r
 * Space: O(n) dp array to record the current substring vailidation
 */

- (BOOL)validConcat2: (NSString *)s l:(NSInteger)l r:(NSInteger)r words: (NSArray<NSString *> *)words {
     //Set a dp array to represent the current substring validation
    NSMutableArray *valid = [[NSMutableArray alloc]initWithCapacity:r - l + 1];
    //Use hashMap is faster than words.contains()
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    for (NSString *word in words) {
        if (!dict[word]) dict[word] = @1;
        else {
            NSNumber *cur = dict[word];
            dict[word] = [NSNumber numberWithInteger:[cur integerValue] + 1];
        }
    }
    for (NSInteger i = l; i <= r; i++) {
        NSString *curStr = [s substringWithRange:NSMakeRange(l, i - l + 1)];
        NSNumber *curNum = dict[curStr];
        //If current substring is already valid, set dp value to true
        //If there's at least one more word in the hashMap
        if (curNum.integerValue > 0) {
            valid[i - 1] = @1;
            dict[curStr] = [NSNumber numberWithInteger:curNum.integerValue + 1];
        } else {
            //If current substring cannot be immediately be concat by words in array, verify each substring in the current substring from the record in dp array, if left part is valid in array and right part is valid though word array, this total substring is valid, so set dp value to true
            for (NSInteger j = l; j < i; j++) {
                NSString *curStr2 = [s substringWithRange:NSMakeRange(j + 1, i - j + 1)];
                NSNumber *curNum2 = dict[curStr2];
                if (valid[j - 1] && curNum.integerValue > 0) {
                    valid[j - 1] = @1;
                    dict[curStr2] = [NSNumber numberWithInteger:curNum2.integerValue - 1];
                    break;
                }
            }
        }
    }
    return [valid[valid.count - 1] isEqualToNumber:@1];
}

@end
