//
//  Palindrome_Number.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/10/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Palindrome_Number.h"

@implementation Palindrome_Number

/**
 * 9. Palindrome Number
 * Determine whether an integer is a palindrome. Do this without extra space.
 */

/**
 * Solution:
 * Base case:
 *      1. cannot use parse to String, due to no extra space
 *      2. cannot revert all the integer due to may overflow
 *      3. be aware of if negative number
 * Revert at most half of integer to compare new generated integer with rest of origin integer
 */
- (BOOL)isPalindrome: (NSInteger)x {
    //If x is like 20, 2320, use follow while loop will be true, but they actually are false
    if (x < 0 || (x != 0 && x % 10 == 0)) return NO;
    //While loop until new number is larger or equal to rest of old number, at most will be half length of orginal number, which will guarantee not overflow
    NSInteger temp = 0;
    while (temp < x) {
        temp = temp * 10 + x % 10;
        x /= 10;
    }
    //if 2332, x == temp, if 9 or 232 x == temp/10
    return temp = x/10 || temp == x;
}

@end
