//
//  Longest_SubStr_NoRepeat.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/10/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Q3LongestSubstringWithoutRepeatingCharacters.h"

@implementation Q3LongestSubstringWithoutRepeatingCharacters

//Difficulty: medium
//TAG: Apple
//TAG: string
//TAG: sliding window

/**
 * 3. Longest Substring Without Repeating Characters
 * Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 Given "abcabcbb", the answer is "abc", which the length is 3.
 Given "bbbbb", the answer is "b", with the length of 1.
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

/**
 * Solution:
 * 1. Sliding window problem, keep a window which start from beginning of s, try to increase the length of the window
 * 2. use a set or HashMap to filter the duplicate character, keep that there's no duplicate character in current window
 *      1. if current character is not duplicated in the window, increase the window length and go next
 *      2. if current character is duplicated
 *          1. move left index to right until met the right index or skip the duplicate element
 * 3. Update a global max length no matter met the duplicate character or not, when met the end and it's increasing, need to update, not only when met dup character
 *
 * Time: n represent the length of string s, when each step left need to move and finally the result is last one character, it's O(2n) = O(n)
 * Space: O(n) n represent the len of s, when there's no duplicate character in string and need to record all kinds of character in string s,
 *      *** here need to discuss about how string s is combined, ASCII or Unicode ? Space may be O(256) or O(len(unicode)) ***
 */

- (NSInteger)lengthOfLongestSubstring: (NSString *)s {
    if (s.length < 2) return s.length;
    int res = 0, left = 0, right = 0;
    NSMutableDictionary<NSString *, NSNumber *> *map = [[NSMutableDictionary alloc]init];
    while(right < s.length) {
        NSString *curKey = [s substringWithRange:NSMakeRange(right, 1)];
        NSNumber *cur = map[curKey];
        //When there's no character, put count as 1
        if (!cur) map[curKey] = @1;
        else {
            //First need to increase the count, otherwise while loop will stop when contains two dup char at left and right
            map[curKey] = [NSNumber numberWithInteger:[cur integerValue] + 1];
            //Decrease the count of all elements before appeared dup character
            while ([map[curKey] integerValue] > 1) {
                NSString *decKey = [s substringWithRange:NSMakeRange(left, 1)];
                NSInteger decNum = [map[decKey] integerValue];
                map[decKey] = [NSNumber numberWithInteger:decNum - 1];
                left++;
            }
        }
        //No matter it increasing or adjust to proper len, need to update global max length
        res = MAX(res, right - left + 1);
        right++;
    }
    return res;
}

@end
