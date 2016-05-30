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

@end
