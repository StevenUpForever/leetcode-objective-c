//
//  Longest_Palindromic_Substring.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/10/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Longest_Palindromic_Substring.h"

@interface Longest_Palindromic_Substring()

//Sometimes global variable is better than pass to many parameters in helper function
@property (nonatomic, assign) NSInteger left;
@property (nonatomic, assign) NSInteger right;
@property (nonatomic, assign) NSInteger len;

@end

@implementation Longest_Palindromic_Substring

/**
 * 5. Longest Palindromic Substring
 * Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 Example:
 
 Input: "babad"
 
 Output: "bab"
 
 Note: "aba" is also a valid answer.
 Example:
 
 Input: "cbbd"
 
 Output: "bb"
 */

/**
 * Solution:
 * Iterative all characters in string
 *      1. for each character, start from current char, expand to left and right, ensure current str is a palindrome
 *      2. update the global max
 *
 * Time: worst case is when "aaaaaa", each character could go fully the shorter side (left, right)
 *       1 + 2 + ... n/2 = O(n/2(n/2 + 1)/2) = O(n^2)
 *       ***consider about odd length palindrome string like "aba" and event length palindrome string like "aa", need to verify two conditions for each character, it's O(2n^2)
 * Space: O(1)
 */

- (NSString *)longestPalindrome: (NSString *)s {
    if (s.length == 0) return s;
    for (int i = 0; i < s.length; i++) {
        //Need to check odd length and even length palindrome string
        [self palindromeHelper:s left:i right:i];
        [self palindromeHelper:s left:i right:i + 1];
    }
    return [s substringWithRange:NSMakeRange(self.left, self.right - self.left + 1)];
}

- (void)palindromeHelper: (NSString *)s left: (NSInteger)l right: (NSInteger)r {
    while (l >= 0 && r < s.length && [s characterAtIndex:l] == [s characterAtIndex:r]) {
        l--;
        r++;
    }
    if (r - l - 1 > self.len) {
        self.left = l;
        self.right = r;
        self.len = r - l - 1;
    }
}

@end
