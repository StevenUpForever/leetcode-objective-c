//
//  Problem1To10.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/14/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListNode;
@interface Problem1To10 : NSObject

- (NSArray<NSNumber *> *)twoSum: (NSArray<NSNumber *> *)nums target: (NSInteger)target;
- (ListNode *)addTwoNumbers: (ListNode *)l1 listNode2: (ListNode *)l2;
- (NSInteger)lengthOfLongestSubstring: (NSString *)s;
- (double)findMedianSortedArrays: (NSArray<NSNumber *> *)num1 andNum2: (NSArray<NSNumber *> *)num2;
- (NSString *)longestPalindrome: (NSString *)s;
- (NSString *)convert: (NSString *)s numRows: (int) numRows;
- (NSInteger)reverse: (NSInteger)x;
- (NSInteger)myAtoi: (NSString *)str;
- (BOOL)isPalindrome: (int)x;
- (BOOL)isMatch: (NSString *)s strP: (NSString *)p;

@end
