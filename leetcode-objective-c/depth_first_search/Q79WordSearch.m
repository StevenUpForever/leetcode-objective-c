//
//  Q79.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q79WordSearch.h"

@implementation Q79WordSearch

//Difficulty: medium
//TAG: Apple
//TAG: Snap
//TAG: dfs

/**
 * 79. Word Search
 * Given a 2D board and a word, find if the word exists in the grid.
 
 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
 
 For example,
 Given board =
 
 [
 ['A','B','C','E'],
 ['S','F','C','S'],
 ['A','D','E','E']
 ]
 word = "ABCCED", -> returns true,
 word = "SEE", -> returns true,
 word = "ABCB", -> returns false.
 */

/*
* Solution 2:
* Depends on solution 1, all elements in this problem in matrix are from 'A' to 'Z', which we could modify the original matrix value to a non 'A' - 'Z'
*
* Time: O(4^max(m, n))
* Space: O(1)
*/

- (BOOL)exist: (char[][])board word:(NSString *)word {
    
}

- (BOOL)dfs: (char[][])board word:(NSString *)word index: (NSInteger)index i: (int)i j: (int)j {
    if (inde)
}

@end
