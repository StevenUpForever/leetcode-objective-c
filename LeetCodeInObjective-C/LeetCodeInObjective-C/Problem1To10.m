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


@end

