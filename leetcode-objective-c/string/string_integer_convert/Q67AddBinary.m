//
//  Q67AddBinary.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/12/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q67AddBinary.h"

@implementation Q67AddBinary

//TAG: Facebook
//TAG: String
//Difficulty: Easy

/**
 * 67. Add Binary
 * Given two binary strings, return their sum (also a binary string).
 
 For example,
 a = "11"
 b = "1"
 Return "100".
 */

/*
 * Solution:
 * Add bits of a and b from the end to start
 * Keep a carry of the current result
 * append result to the stringBuilder
 * append carry of carry is > 0
 * reverse the result string and return
 *
 * Time: O(max(a, b))
 * Space: O(max(a, b))
 */

- (NSString *)addBinary: (NSString *)a b: (NSString *)b {
    NSMutableString *mut = [NSMutableString new];
    NSInteger carry = 0;
    for (NSInteger i = 0; i < MAX(a.length, b.length); i++) {
        NSInteger sum = carry;
        sum += i < a.length ? [a characterAtIndex:a.length - 1 - i] : 0;
        sum += i < b.length ? [b characterAtIndex:b.length - 1 - i] : 0;
        [mut appendFormat:@"%li", sum%2];
        carry = sum/2;
    }
    if (carry > 0) [mut appendFormat:@"%li", carry];
    for (NSInteger l = 0, r = mut.length - 1; l < r; l++, r--) {
        char c = [mut characterAtIndex:l];
        [mut replaceCharactersInRange:NSMakeRange(l, 1) withString:[mut substringWithRange:NSMakeRange(r, 1)]];
        [mut replaceCharactersInRange:NSMakeRange(r, 1) withString:[NSString stringWithFormat:@"%c", c]];
    }
    return [mut copy];
}

@end
