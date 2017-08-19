//
//  Divide_Two_Integers.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/18/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Divide_Two_Integers.h"

@implementation Divide_Two_Integers

/**
 * 29. Divide Two Integers
 * Divide two integers without using multiplication, division and mod operator.
 If it is overflow, return MAX_INT.
 */

/**
 * Solution 1:
 * Use add, assume current add count is n, keep dividend and divisor positive numbers and keep a flag to represent the result is a positive or negative number
 *      1. when add n times is larger than dividend, return n - 1
 *      2. when add n times is equal to dividend, return n
 *
 * Time: O(n)
 * Space: O(1)
 */
- (NSInteger)divideS1: (NSInteger)dividend divisor: (NSInteger)divisor {
    if (divisor == 0 || (dividend == NSIntegerMin && divisor == - 1)) return NSIntegerMax;
    NSInteger divd = ABS(dividend), divs = ABS(divisor), cur = divs;
    NSInteger flag = (dividend < 0) ^ (divisor < 0) ? -1 : 1, n = 1;
    while (cur < divd) {
        cur += divs;
        n++;
    }
    return flag * (cur == divd ? n : n - 1);
}

/**
 * Solution 2:
 * bit shift is similar as multiple, 2 << 1 == 2 * 2 == 4, << 1 is faster than + 1
 * loop until divd (decrease) is equal or smaller than divs
 *      Multiple divd and multiple by 2 each time (shift << 1) until divs smaller than divd
 *      minus current added divs from divd
 *      add current added multiple to result
 *  be aware of when result (long type) is larger than Int.MAX, otherwise use result value itself
 *
 *  Time: O((logn)^2)
 *  Space: O(1)
 */
- (NSInteger)divideS2: (NSInteger)dividend divisor: (NSInteger)divisor {
    if (divisor == 0 || (dividend == NSIntegerMin && divisor == - 1)) return NSIntegerMax;
    //Set result temporarily to long, it may integer overflow when result should be Int.min and now it's 2147483648
    NSInteger divd = ABS(dividend), divs = ABS(divisor), res = 1;
    NSInteger flag = (dividend < 0) ^ (divisor < 0) ? -1 : 1;
    while (divs <= divd) {
        NSInteger temp = divs, mult = 1;
        //divd >= (temp << 1) make sure when end the loop, temp is smaller or equal
        //Inner loop is make a temp smaller or equal to divd, because it's not increase by divs, but increase by itself as << 1, so it may not properly divided once, need to go rest of number and do << 1
        /*
         For example, when divd == 26, divs == 2
         when first time the inner loop done, divs = 16, 32 will over 26, this time divd = 26 - 16 = 10
         next loop finally divs = 8, divd = 10 - 8 = 2
         Third loop will done
         */
        while (divd >= temp << 1) {
            temp <<= 1;
            mult <<= 1;
        }
        divd -= temp;
        NSInteger added = res + mult;
        if (added > NSIntegerMax) return flag == 1 ? NSIntegerMax : NSIntegerMin;
        else res += mult;
    }
    return flag * res;
}

@end
