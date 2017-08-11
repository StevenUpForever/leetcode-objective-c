//
//  Add_Two_Numbers.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 4/27/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Add_Two_Numbers.h"
#import "ListNode.h"

@implementation Add_Two_Numbers

/**
 * 2. Add Two Numbers
 * You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 */

/**
 * Solution:
 * The order of list represent the number from lower level to higher level, either choose add number one by one or parse lists to two numbers and add them are the same
 * add number by each bit
 * 1. keep a carry at the same time
 * 2. be aware of the post step of longer part of the longer list
 * 3. be aware of when addition is done and carray is still > 0 then need to add new listNode at the end of result list
 *
 * Time: O(m + n) m, n represent length of l1 and l2
 * Space: O(Math.max(m, n)) alloc a new list to save the addition result, which the length of result is the within [max(m, n), max(m, n) + 1]
 */

- (ListNode *)addTwoNumbers: (ListNode *)l1 andTwo: (ListNode *)l2 {
    ListNode *temp1 = l1, *temp2 = l2;
    ListNode *res = [[ListNode alloc]init:0];
    ListNode *temp = res;
    NSInteger carry = 0;
    while (temp1 != nil || temp2 != nil) {
        NSInteger num1 = temp1 == nil ? 0 : temp1.val;
        NSInteger num2 = temp2 == nil ? 0 : temp2.val;
        NSInteger sum = num1 + num2 + carry;
        temp.next = [[ListNode alloc]init:sum % 10];
        carry = sum/10;
        if (temp1 != nil) temp1 = temp1.next;
        if (temp2 != nil) temp2 = temp2.next;
        temp = temp.next;
    }
    if (carry > 0) temp.next = [[ListNode alloc]init:carry];
    return res.next;
}


@end
