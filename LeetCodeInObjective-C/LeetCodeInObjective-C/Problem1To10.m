//
//  Problem1To10.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/14/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem1To10.h"
#import "ListNode.h"

@implementation Problem1To10

/*
 1. Two Sum
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 UPDATE (2016/2/13):
 The return format had been changed to zero-based indices. Please read the above updated description carefully.
 */

- (NSArray<NSNumber *> *)twoSum: (NSArray<NSNumber *> *)nums target: (NSInteger)target {
    for (int index1 = 0; index1 < nums.count - 1; index1++) {
        for (int index2 = index1 + 1; index2 < nums.count; index2++) {
            if (nums[index1].integerValue + nums[index2].integerValue == target) {
                return @[[NSNumber numberWithInt:index1], [NSNumber numberWithInt:index2]];
            }
        }
    }
    return @[@0, @0];
}

/*
 2. Add Two Numbers
 You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 */

- (ListNode *)addTwoNumbers: (ListNode *)l1 listNode2: (ListNode *)l2 {
    ListNode *temp = [[ListNode alloc]initWithVal:0];
    ListNode *result = temp;
    while (l1 != nil || l2 != nil) {
        NSInteger sum = 0;
        if (l1 != nil) {
            sum += l1.val;
            l1 = l1.next;
        }
        if (l2 != nil) {
            sum += l2.val;
            l2 = l2.next;
        }
        NSInteger nextExist = temp.next == nil ? 0 : 1;
        temp.next = [[ListNode alloc]initWithVal:(sum + nextExist) % 10];
        temp = temp.next;
        //Here temp.next actually is the start temp.next.next in the current loop
        if (sum%10 == 1) temp.next = [[ListNode alloc]initWithVal:1];
    }
    return result.next;
}

/*3. Longest Substring Without Repeating Characters
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 
 Given "bbbbb", the answer is "b", with the length of 1.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */
- (NSInteger)lengthOfLongestSubstring: (NSString *)s {
    NSInteger len = s.length;
    if (len < 2) return len;
    NSInteger result = 0, lenNow = 0;
    NSMutableDictionary *indexDict = [[NSMutableDictionary alloc]init];
    for (NSInteger index = 0; index < len; index++) {
        lenNow++;
        NSString *charStr = [NSString stringWithFormat:@"%c",[s characterAtIndex:index]];
        if ([indexDict.allKeys containsObject:charStr]) {
            lenNow = MIN(lenNow, index - [[indexDict.allValues objectAtIndex:index] integerValue]);
        }
        [indexDict setObject:[NSNumber numberWithInteger:index] forKey:charStr];
        result = MAX(result, lenNow);
    }
    return result;
}

/*4. Median of Two Sorted Arrays
 There are two sorted arrays nums1 and nums2 of size m and n respectively. Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 */
- (double)findMedianSortedArrays: (NSArray<NSNumber *> *)num1 andNum2: (NSArray<NSNumber *> *)num2 {
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    NSInteger index1 = 0, index2 = 0;
    while (index1 < num1.count && index2 < num2.count) {
        if ([num1[index1] integerValue] <= [num2[index2] integerValue]) {
            [resultArray addObject:num1[index1]];
            index1++;
        } else {
            [resultArray addObject:num2[index2]];
            index2++;
        }
    }
    if (index1 < num1.count) {
        [resultArray addObjectsFromArray:[num1 subarrayWithRange:NSMakeRange(index1, num1.count - index1)]];
    } else if (index2 < num2.count) {
        [resultArray addObjectsFromArray:[num2 subarrayWithRange:NSMakeRange(index2, num2.count - index2)]];
    }
    NSLog(@"%@", resultArray);
    NSInteger len = resultArray.count;
    return len % 2 == 0 ? (double)([resultArray[len/2] integerValue] + [resultArray[len/2 - 1] integerValue])/2 : (double)[resultArray[len/2] integerValue];
}

/*
 5. Longest Palindromic Substring
 Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.
 */
- (NSString *)longestPalindrome: (NSString *)s {
    
    NSRange range = NSMakeRange(0, 1);
    for (int index = 0; index < s.length - 1; index++) {
        NSRange resultRange = [self palindromeString:s startIndex:index endIndex:index];
        NSRange resultRange2 = [self palindromeString:s startIndex:index endIndex:index + 1];
        NSRange comparedRange = resultRange.length > resultRange2.length ? resultRange : resultRange2;
        range = comparedRange.length > range.length ? comparedRange : range;
    }
    return [s substringWithRange:range];
}

- (NSRange)palindromeString: (NSString *)str startIndex: (NSInteger)startIndex endIndex: (NSInteger)endIndex {
    while (startIndex >= 0 && endIndex < str.length && [str characterAtIndex:startIndex] == [str characterAtIndex:endIndex]) {
        startIndex--;
        endIndex++;
    }
    return NSMakeRange(startIndex + 1, endIndex - startIndex - 1);
}

/*
 8. String to Integer (atoi)
 Implement atoi to convert a string to an integer.
 
 Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.
 
 Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.
 
 Update (2015-02-10):
 The signature of the C++ function had been updated. If you still see your function signature accepts a const char * argument, please click the reload button  to reset your code definition.
 
 spoilers alert... click to show requirements for atoi.
 */
- (NSInteger)myAtoi: (NSString *)str {
    NSInteger len = str.length;
    if (len == 0) return 0;
    NSInteger index = 0;
    while (index < len && [str characterAtIndex:index] == ' ') index++;
    NSInteger positiveNum = 1;
    if ([str characterAtIndex:index] == '+' || [str characterAtIndex:index] == '-') {
        positiveNum = [str characterAtIndex:index] == '+';
        index++;
    }
    NSInteger result = 0;
    while (index < len) {
        NSInteger tempNum = [str characterAtIndex:index] - '0';
        if (tempNum < 0 || tempNum > 9) break;
        if (result > INT_MAX/10 || (result == INT_MAX/10 && result % 10 > 7)) return positiveNum ? INT_MAX : INT_MIN;
        result = result * 10 + tempNum;
    }
    return positiveNum * result;
}


@end

