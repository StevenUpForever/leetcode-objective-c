//
//  Q953VerifyingAnAlienDictionary.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/13/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q953VerifyingAnAlienDictionary.h"

@implementation Q953VerifyingAnAlienDictionary

//Difficulty: easy
//TAG: Facebook
//TAG: String

/**
 * 953. Verifying an Alien Dictionary
 * In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.
 *
 * Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.
 *
 *
 *
 * Example 1:
 *
 * Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
 * Output: true
 * Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
 * Example 2:
 *
 * Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
 * Output: false
 * Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
 * Example 3:
 *
 * Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
 * Output: false
 * Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
 *
 *
 * Note:
 *
 * 1 <= words.length <= 100
 * 1 <= words[i].length <= 20
 * order.length == 26
 * All characters in words[i] and order are english lowercase letters.
 */

/*
 Solution:
 
 1. make chars in order as relative order in nums array
 2. compare word one pair at a time, find out new relative order
 
 Time: O(n + k) n is length of words, k is length of order
 Space: O(1)
 */

- (BOOL)isAlienSorted: (NSArray<NSString *> *)words : (NSString *)order {
    int count[26] = {0};
    for (int i = 0; i < order.length; i++) {
        char c = [order characterAtIndex:i];
        count[c - 'a'] = i;
    }
    for (NSInteger i = 0; i < words.count - 1; i++) {
        NSString *cur = words[i], *next = words[i + 1];
        BOOL skip = NO;
        NSInteger index = 0;
        for (; index < MIN(cur.length, next.length); index++) {
            char c1 = [cur characterAtIndex:i], c2 = [next characterAtIndex:i];
            if (count[c1 - 'a'] < count[c2 - 'a']) {
                skip = YES;
                break;
            } else if (count[c1 - 'a'] > count[c2 - 'a']) return NO;
        }
        if (!skip && index < cur.length) return NO;
    }
    return YES;
}


@end
