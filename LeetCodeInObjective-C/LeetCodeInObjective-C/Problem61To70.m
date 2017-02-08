//
//  Problem61To70.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 7/14/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem61To70.h"

@implementation Problem61To70

/*
 67. Add Binary
 Given two binary strings, return their sum (also a binary string).
 
 For example,
 a = "11"
 b = "1"
 Return "100".
 */
/*
 Approach: use normal binary calculation from the end to front
 Time: O(Math.max(a.length(), b.length()))
 Spance: O(Math.max(a.length(), b.length()))
 */
- (NSString *)addBinary: (NSString *)a andB: (NSString *)b {
    NSInteger lena = a.length - 1, lenb = b.length - 1;
    NSInteger shift = 0;
    NSMutableString *str = [[NSMutableString alloc]init];
    while (lena >= 0 || lenb >= 0) {
        NSInteger cur = shift;
        if (lena >= 0) {
            cur += [a characterAtIndex:lena] - '0';
            lena--;
        }
        if (lenb >= 0) {
            cur += [b characterAtIndex:lenb] - '0';
            lenb--;
        }
        cur = cur % 2;
        [str appendFormat:@"%li", cur];
        shift = cur / 2;
    }
    if (shift != 0) {
        [str appendFormat:@"%li", shift];
    }
    NSMutableString *result = [[NSMutableString alloc]init];
    for (NSInteger i = str.length - 1; i >= 0; i--) {
        [result appendFormat:@"%c", [str characterAtIndex:i]];
    }
    return [[NSString alloc]initWithString:result];
}

/*
 70. Climbing Stairs
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 */
- (NSInteger)climbStairs: (NSInteger)n {
    if (n < 3) {
        return n;
    }
    int result[] = {0};
    for (int i = 2; i < n; i++) {
        result[i] = result[i - 1] + result[i - 2];
    }
    return result[n - 1];
}

@end
