//
//  Q127WordLadder.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q127WordLadder.h"

@implementation Q127WordLadder

//Difficulty: Medium
//TAG: LinkedIn
//TAG: Apple
//TAG: Snap
//TAG: BFS
//TAG: DFS

/**
 * 127. Word Ladder
 * Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:
 
 Only one letter can be changed at a time.
 Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
 For example,
 
 Given:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log","cog"]
 As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
 return its length 5.
 
 Note:
 Return 0 if there is no such transformation sequence.
 All words have the same length.
 All words contain only lowercase alphabetic characters.
 You may assume no duplicates in the word list.
 You may assume beginWord and endWord are non-empty and are not the same.
 UPDATE (2017/1/20):
 The wordList parameter had been changed to a list of strings (instead of a set of strings). Please reload the code definition to get the latest changes.
 */

/*
* Solution 2: BFS
* Depends on solution 1, we have something to improve:
*      1. depth_first_search works, but in some specific case, when wordList is very large depth_first_search takes much more time, BFS will be a good choice, when at some level find the endWord, could immediately return current level
*      2. every time we check if could modify word once, and for loop the word all, but if we could for loop once the current word and add all possible modifications in wordsList into next level, that will be better when word.length is very long
* *** Although wordsList changed to list, we'd better change it to HashSet so that as inner loop could check wordList.contains(target) faster ***
*
* Time: O(n)
* Space: O(n)
*/

- (NSInteger)ladderLength: (NSString *)beginWord endWord: (NSString *)endWord wordList: (NSArray<NSString *> *)wordList {
    NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *dict = [[NSMutableDictionary alloc]init];
    for (NSInteger i = 0; i < wordList.count; i++) {
        if (!dict[wordList[i]]) {
            dict[wordList[i]] = [[NSMutableArray alloc]init];
        }
        for (NSInteger j = 0; j < i; j++) {
            if ([self oneDistance:wordList[i] str2:wordList[j]]) {
                [dict[wordList[i]] addObject:wordList[j]];
                [dict[wordList[j]] addObject:wordList[i]];
            }
        }
    }
    NSInteger step = 1;
    NSMutableArray<NSString *> *queue = [[NSMutableArray alloc]init];
    [queue addObject:beginWord];
    while (queue.count != 0) {
        NSInteger size = queue.count;
        while (size-- > 0) {
            NSString *poll = queue.firstObject;
            [queue removeObjectAtIndex:0];
            for (NSString *next in dict[poll]) {
                if ([next isEqualToString:endWord]) {
                    return step;
                }
                [queue addObject:next];
            }
        }
        step++;
    }
    return 0;
}

- (BOOL)oneDistance: (NSString *)str1 str2: (NSString *)str2 {
    int count[26];
    for (NSInteger i = 0; i < str1.length; i++) {
        count[[str1 characterAtIndex:i] - 'a']++;
    }
    for (NSInteger i = 0; i < str2.length; i++) {
        count[[str2 characterAtIndex:i] - 'a']--;
    }
    int diff = 0;
    for (int i = 0; i < 26; i++) {
        if (count[i] != 0) {
            diff++;
        }
    }
    return diff == 1;
}


@end
