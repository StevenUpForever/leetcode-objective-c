//
//  Q125ValidPalindrome.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/19/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q125ValidPalindrome.h"

@implementation Q125ValidPalindrome

//TAG: Facebook
//TAG: Microsoft
//TAG: Uber
//TAG: String
//TAG: Palindrome
//Difficulty: Easy

/**
 * 125. Valid Palindrome
 * Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 For example,
 "A man, a plan, a canal: Panama" is a palindrome.
 "race a car" is not a palindrome.
 
 Note:
 Have you consider that the string might be empty? This is a good question to ask during an interview.
 
 For the purpose of this problem, we define empty string as valid palindrome.
 */

/*
 * Solution:
 * Time: O(n)
 * Space: O(1)
 */

- (BOOL)isPalindrome: (NSString *)s {
    NSInteger l = 0, r = s.length - 1;
    while (l < r) {
        char c1 = [s characterAtIndex:l], c2 = [s characterAtIndex:r];
        if (c1 - 'a' < 0 || c1 - 'a' > 25) {
            l++;
        } else if (c2 - 'a' < 0 || c2 - 'a' > 25) {
            r--;
        } else if (c1 == c2) {
            l++;
            r--;
        } else return NO;
    }
    return YES;
}

@end
