//
//  Q269AlienDictionary.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q269AlienDictionary.h"

@implementation Q269AlienDictionary

//Difficulty: Hard
//TAG: Airbnb
//TAG: Facebook
//TAG: BFS

/**
 * 269. Alien Dictionary
 * There is a new alien language which uses the latin alphabet. However, the order among letters are unknown to you. You receive a list of non-empty words from the dictionary, where words are sorted lexicographically by the rules of this new language. Derive the order of letters in this language.
 *
 * Example 1:
 *
 * Input:
 * [
 *   "wrt",
 *   "wrf",
 *   "er",
 *   "ett",
 *   "rftt"
 * ]
 *
 * Output: "wertf"
 * Example 2:
 *
 * Input:
 * [
 *   "z",
 *   "x"
 * ]
 *
 * Output: "zx"
 * Example 3:
 *
 * Input:
 * [
 *   "z",
 *   "x",
 *   "z"
 * ]
 *
 * Output: ""
 *
 * Explanation: The order is invalid, so return "".
 * Note:
 *
 * You may assume all letters are in lowercase.
 * You may assume that if a is a prefix of b, then a must appear before b in the given dictionary.
 * If the order is invalid, return an empty string.
 * There may be multiple valid order of letters, return any one of them is fine.
 */

/*
 Solution:
 1. Only compare orders vertically
 2. compare two strings each time, skip same chars, when c1 != c2 compare and skip current two string compare
 when one char has nothing to compare vertically, ignore it (not mean this char has higher priority)
 
 Use one hashMap to save all lower priority chars of current char
 Use another hashMap save all chars degree, +1 every time when find a char higher than it
 Finally use BFS, add degree 0 chars to queue, every time decrease degree of poll char followings
 
 assume words length n, average word length m
 then Time: O(mn + mn + mn) = O(mn)
 Space: O(mn)
 */

- (NSString *)alienOrder: (NSArray<NSString *> *)words {
    if (!words) return @"";
    NSMutableDictionary<NSString *, NSMutableSet<NSString *> *> *followings = [NSMutableDictionary new];
    NSMutableDictionary<NSString *, NSNumber *> *degree = [NSMutableDictionary new];
    for (NSString *word in words) {
        for (NSInteger i = 0; i < word.length; i++) {
            NSString *key = [NSString stringWithFormat:@"%c", [word characterAtIndex:i]];
            degree[key] = @0;
        }
    }
    for (NSInteger i = 0; i < words.count - 1; i++) {
        NSString *cur = words[i], *next = words[i + 1];
        for (NSInteger j = 0; j < MIN(cur.length, next.length); j++) {
            NSString *key1 = [NSString stringWithFormat:@"%c", [cur characterAtIndex:j]],
            *key2 = [NSString stringWithFormat:@"%c", [next characterAtIndex:j]];
            if ([key1 isEqualToString:key2]) continue;
            if (!followings[key1]) followings[key1] = [NSMutableSet new];
            if (![followings[key1] containsObject:key2]) {
                [followings[key1] addObject:key2];
                degree[key2] = @(degree[key2].integerValue + 1);
            }
        }
    }
    NSMutableArray<NSString *> *queue = [NSMutableArray new];
    for (NSString *key in degree.allKeys) {
        if ([degree[key] isEqualToNumber:@0]) [queue addObject:key];
    }
    NSMutableString *res = [NSMutableString new];
    while (queue.count > 0) {
        NSString *poll = queue.firstObject;
        [queue removeObjectAtIndex:0];
        [res appendString:poll];
        for (NSString *val in followings[poll]) {
            degree[val] = @(degree[val].integerValue - 1);
            if ([degree[val] isEqualToNumber:@0]) [queue addObject:val];
        }
    }
    return [res copy];
}

@end
