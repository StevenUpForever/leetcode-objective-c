//
//  Roman_to_Integer.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/15/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Roman_to_Integer.h"

@implementation Roman_to_Integer

/**
 * 13. Roman to Integer
 * Given a roman numeral, convert it to an integer.
 Input is guaranteed to be within the range from 1 to 3999.
 */

/**
 * Solution:
 * Roman has a feature that about the last second number of 5 or 10, it's smaller append larger number, otherwise, it's larger number append multiple smaller or equal number, so we parse the roman from end to start
 * 1. Need a dictionary to represent different level of roman (multiple by 5), for 1, 5, 10, 50, 100, 500, 1000, every roman is combine with several roman from these tagged romans
 * 2. loop from end of s to front
 *      1. when current roman is larger than pre one (next roman), means it's a number except 5, 10, increase the current number
 *      2. when current roman is smaller than pre one, like "IV" 4, "IX" 9, means we decrease pre number 5, 10 by current roman 1 to 4, 9
 * 3. When met the next level number, repeat step 2
 * 4. got final integer and return, not necessary to * 10 + % 10, due to different roman represent already enough bits of 0s [1, 10, 100, 1000]
 *
 * Time: O(n)
 * Space: O(1) constant space for map
 */
- (NSInteger)romanToInt: (NSString *)s {
    if (s.length < 1) return 0;
    NSDictionary *dict = @{@"I": @1, @"V": @5, @"X": @10, @"L": @50, @"C": @100, @"D": @500, @"M": @1000};
    //Max Roman to 3999, so int is enough
    NSInteger res = [dict[[NSString stringWithFormat:@"%c", [s characterAtIndex:s.length - 1]]] integerValue];
    //Keep a global pre number to compare with current number to determine if need to add or minus
    NSInteger pre = res;
    for (NSInteger i = s.length - 2; i >= 0; i--) {
        NSInteger cur = [dict[[NSString stringWithFormat:@"%c", [s characterAtIndex:i]]] integerValue];
        /*
         This is else contained several conditions
         1. when cur and pre is at same level, like I and V, (for example III, VI, IV) it's right
         2. when cur and pre is not at same level, like I and X (for example cur is X, pre is I, or reverse order, means IX 9, or XI 11) it right
         */
        if (cur < pre) res -= cur;
        else res += cur;
        pre = cur;
    }
    return res;
}

@end
