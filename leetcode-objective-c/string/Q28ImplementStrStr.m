//
//  Implement_strStr.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/18/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Q28ImplementStrStr.h"

@implementation Q28ImplementStrStr

//Difficulty: Easy
//TAG: Apple
//TAG: String

/**
 * 28. Implement strStr()
 * Implement strStr().
 
 Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 */

/*
 * Solution:
 * for loop the haystack, when met the first character, try to match next one, is all matches, immediately return the index of the first character
 *
 * Time: O(mn) m represent length of haystack, n represent length of needle
 * Space: O(1)
 */

- (NSInteger)strStr: (NSString *)haystack needle: (NSString *)needle {
    if (haystack.length == 0 || needle.length == 0) return 0;
    //Be aware of <= , simple example, when chars1.len == chars2.len, i should start from 0
    for (int i = 0; i <= haystack.length - needle.length; i++) {
        int j = 0;
        while (j < needle.length && [haystack characterAtIndex:i + j] == [needle characterAtIndex:j]) j++;
        if (j == needle.length) return i;
    }
    return -1;
}

@end
