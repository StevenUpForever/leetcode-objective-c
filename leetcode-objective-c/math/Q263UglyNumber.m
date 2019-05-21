//
//  Q263UglyNumber.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q263UglyNumber.h"

@implementation Q263UglyNumber

//Difficulty: easy
//TAG: math

/**
 * 263. Ugly Number
 * Write a program to check whether a given number is an ugly number.
 *
 * Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.
 *
 * Example 1:
 *
 * Input: 6
 * Output: true
 * Explanation: 6 = 2 × 3
 * Example 2:
 *
 * Input: 8
 * Output: true
 * Explanation: 8 = 2 × 2 × 2
 * Example 3:
 *
 * Input: 14
 * Output: false
 * Explanation: 14 is not ugly since it includes another prime factor 7.
 * Note:
 *
 * 1 is typically treated as an ugly number.
 * Input is within the 32-bit signed integer range: [−231,  231 − 1].
 */

/*
 Solution:
 
 first keep num /= 2 if it could (num % 2 == 0) keep same as 3 and 5
 finally check if num == 1
 
 Time: O(logn)
 Space: O(1)
 */

- (BOOL)isUgly: (NSInteger)num {
    if (num <= 0) return NO;
    while (num % 2 == 0) num /= 2;
    while (num % 3 == 0) num /= 3;
    while (num % 5 == 0) num /= 5;
    return num == 1;
}

@end
