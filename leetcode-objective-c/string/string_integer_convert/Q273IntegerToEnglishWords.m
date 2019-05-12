//
//  Q273IntegerToEnglishWords.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/11/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q273IntegerToEnglishWords.h"

@interface Q273IntegerToEnglishWords()

@property (nonatomic, copy) NSArray<NSString *> *lessThanTwenty;
@property (nonatomic, copy) NSArray<NSString *> *tens;
@property (nonatomic, copy) NSArray<NSString *> *thousands;

@end

@implementation Q273IntegerToEnglishWords

//TAG: Facebook
//TAG: String
//Difficulty: Hard

/**
 * 273. Integer to English Words
 * Convert a non-negative integer to its english words representation.
 * Given input is guaranteed to be less than 2^31 - 1.
 
 For example,
 123 -> "One Hundred Twenty Three"
 12345 -> "Twelve Thousand Three Hundred Forty Five"
 1234567 -> "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
 
 Time: O(n)
 Space: O(1)
 */

/*
 * Solution:
 * The numbers cannot reuse and need fast lookup (by array or map) are:
 *  1. one digit number
 *  2. two digits number which between 10-19
 *  3. tens number, e.g. 10, 20, 30, 40......
 *
 * Then every 3 digits number could be reuse but just append proper suffix,
 * e.g. for 123,456,789 could reuse code to generate string 123 & 456 & 789
 * and append Million or Thousand after that
 *
 * concat all strings together and return the result
 *
 * Time: O(n)
 * Space: O(n)
 */

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lessThanTwenty = @[@"", @"One", @"Two", @"Three", @"Four", @"Five", @"Six",
                            @"Seven", @"Eight", @"Nine", @"Ten", @"Eleven", @"Twelve",
                            @"Thirteen", @"Fourteen", @"Fifteen", @"Sixteen", @"Seventeen",
                            @"Eighteen", @"Nineteen"];
        _tens = @[@"", @"Ten", @"Twenty", @"Thirty", @"Forty", @"Fifty", @"Sixty", @"Seventy",
                  @"Eighty", @"Ninety"];
        _thousands = @[@"", @"Thousand", @"Million", @"Billion"];
    }
    return self;
}

- (NSString *)numberToWords: (NSInteger)num {
    NSInteger index = 0;
    NSString *res = @"";
    while (num > 0) {
        if (num % 1000 != 0) {
            res = [NSString stringWithFormat:@"%@ %@ %@", [self helper:num % 1000], self.thousands[index], res];
        }
        num /= 1000;
        index++;
    }
    return res.length == 0 ? @"Zero" : [res stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]];
}

- (NSString *)helper: (NSInteger)num {
    if (num == 0) return @"";
    else if (num < 20) return self.lessThanTwenty[num];
    else if (num < 100) return [NSString stringWithFormat:@"%@ %@", self.tens[num/10], [self helper:num % 10]];
    else return [NSString stringWithFormat:@"%@ Hundred %@", self.lessThanTwenty[num / 100], [self helper:num % 100]];
}



@end
