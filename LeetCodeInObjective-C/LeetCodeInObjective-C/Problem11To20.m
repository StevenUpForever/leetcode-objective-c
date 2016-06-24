//
//  Problem11To20.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 6/23/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem11To20.h"

@implementation Problem11To20

/*
 13. Roman to Integer
 Given a roman numeral, convert it to an integer.
 
 Input is guaranteed to be within the range from 1 to 3999.
 */
- (NSInteger)romanToInt: (NSString *)s {
    if (s.length == 0) {
        return 0;
    }
    NSDictionary *dict = @{@"I": @1, @"V": @5, @"X": @10, @"L": @50, @"C": @100, @"D": @500, @"M": @1000};
    NSInteger result = [[dict objectForKey:[s substringWithRange:NSMakeRange(s.length - 1, 1)]] integerValue];
    NSInteger compareNum = result, index = s.length - 2;
    while (index >= 0) {
        NSInteger currentNum = [[dict objectForKey:[s substringWithRange:NSMakeRange(index, 1)]] integerValue];
        if (currentNum < compareNum) {
            result -= currentNum;
        } else result += currentNum;
        compareNum = currentNum;
        index--;
    }
    return result;
}

@end
