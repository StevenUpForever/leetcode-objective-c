//
//  String_to_Integer.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/10/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "String_to_Integer.h"

@implementation String_to_Integer

/**
 * 8. String to Integer (atoi)
 * Implement atoi to convert a string to an integer.
 
 Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.
 
 Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.
 
 Update (2015-02-10):
 The signature of the C++ function had been updated. If you still see your function signature accepts a const char * argument, please click the reload button  to reset your code definition.
 */

/**
 * Solution:
 * 1. Ignore all prefix white spaces
 * 2. parse integer part to integer until met non-number character
 *      1. consider about if negative number
 *      2. consider about if value is over integer limit
 * 3. Ignore rest part of String
 */
- (NSInteger)myAtoi: (NSString *)str {
    NSInteger res = 0;
    if (str.length == 0) return res;
    int index = 0;
    while (index < str.length && [str characterAtIndex:index] == ' ') index++;
    //If current char is + or - tag a flag for positive/negative number
    NSInteger flag = 1;
    if (index < str.length && ([str characterAtIndex:index] == '-' || [str characterAtIndex:index] == '+')) {
        flag = [str characterAtIndex:index] == '-' ? -1 : 1;
        index++;
    }
    while (index < str.length && [str characterAtIndex:index] - '0' >= 0 && [str characterAtIndex:index] - '0' <= 9) {
        NSInteger newres = res * 10 + [str characterAtIndex:index] - '0';
        //If current number is valid will be append to result, and will over Int.max
        if (newres / 10 != res) {
            return flag == 1 ? NSIntegerMax : NSIntegerMin;
        }
        res = newres;
        index++;
    }
    return res * flag;
}

@end
