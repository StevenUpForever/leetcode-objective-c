//
//  Problem121To130.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/30/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem121To130.h"

@implementation Problem121To130

/*
 121. Best Time to Buy and Sell Stock
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 */
- (NSInteger)maxProfit: (NSArray *)prices {
    if (prices.count == 0) return 0;
    NSInteger profit = [prices.firstObject integerValue], minValue = 0;
    for (NSNumber *num in prices) {
        minValue = MIN(num.integerValue, minValue);
        profit = MAX(num.integerValue - minValue, profit);
    }
    return profit;
}

/*
 125. Valid Palindrome
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 For example,
 "A man, a plan, a canal: Panama" is a palindrome.
 "race a car" is not a palindrome.
 
 Note:
 Have you consider that the string might be empty? This is a good question to ask during an interview.
 
 For the purpose of this problem, we define empty string as valid palindrome.
 */
- (BOOL)isPalindrome: (NSString *)s {
    if (s.length == 0) return YES;
    NSInteger start = 0, end = s.length - 1;
    while (start < end) {
        while ((start < end) && ([s characterAtIndex:start] - 'a' < 0 || [s characterAtIndex:start] - 'a' > 25) && ([s characterAtIndex:start] - '0' < 0 || [s characterAtIndex:start] - '0' > 9)) {
            start++;
        }
        while ((start < end) && ([s characterAtIndex:end] - 'a' < 0 || [s characterAtIndex:end] - 'a' > 25) && ([s characterAtIndex:end] - '0' < 0 || [s characterAtIndex:end] - '0' > 9)) {
            end--;
        }
        if ([s characterAtIndex:start] != [s characterAtIndex:end]) {
            return NO;
        }
        start++;
        end--;
    }
    return YES;
}

@end
