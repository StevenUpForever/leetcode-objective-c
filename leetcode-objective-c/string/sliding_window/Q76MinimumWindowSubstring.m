//
//  Q76MinimumWindowSubstring.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/19/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q76MinimumWindowSubstring.h"

@implementation Q76MinimumWindowSubstring

//Difficulty: Hard
//TAG: Facebook
//TAG: Uber
//TAG: LinkedIn
//TAG: Airbnb
//TAG: Apple
//TAG: String
//TAG: Sliding window

/**
 * 76. Minimum Window Substring
 *
 * Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).
 
 For example,
 S = "ADOBECODEBANC"
 T = "ABC"
 Minimum window is "BANC".
 
 Note:
 If there is no such window in S that covers all characters in T, return the empty string "".
 
 If there are multiple such windows, you are guaranteed that there will always be only one unique minimum window in S.
 */

/*
 * Solution:
 * Sliding window problem
 * Keep a global min length
 * Keep a sliding window length of t, keep record the characters occurrence, increase right side of window, when all characters appeared in the window, keep update the global min length
 * Move left side while all characters appear at least once in the window, keep updating the global min
 *      if some characters out of window, move right until new same character in the window
 *
 * Time: O(2n) left + right = O(n)
 * Space: O()
 */

- (NSString *)minWindow: (NSString *)s t: (NSString *)t {
    NSMutableDictionary<NSString *, NSNumber *> *dict = [NSMutableDictionary new];
    for (NSInteger i = 0; i < t.length; i++) {
        NSString *key = [NSString stringWithFormat:@"%c", [t characterAtIndex:i]];
        dict[key] = @(dict[key].integerValue + 1);
    }
    NSInteger count = 0, min = -1, max = -1, l = 0;
    for (NSInteger r = 0; r < s.length; r++) {
        NSString *cur = [NSString stringWithFormat:@"%c", [s characterAtIndex:r]];
        if (dict[cur]) {
            dict[cur] = @(dict[cur].integerValue - 1);
            if ([dict[cur] isEqualToNumber:@0]) count++;
        }
        if (count == dict.count && (min == -1 || r - l + 1 < max - min + 1)) {
            min = l;
            max = r;
        }
        while (count == dict.count) {
            if (r - l  - 1 < max - min + 1) {
                min = l;
                max = r;
            }
            NSString *lKey = [NSString stringWithFormat:@"%c", [s characterAtIndex:l]];
            if (dict[lKey]) {
                dict[lKey] = @(dict[lKey].integerValue + 1);
                if ([dict[lKey] isEqualToNumber:@1]) count--;
            }
            l++;
        }
    }
    return min == -1 ? @"" : [s substringWithRange:NSMakeRange(min, max - min + 1)];
}

@end
