//
//  Q92ReverseLinkedListII.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q92ReverseLinkedListII.h"
#import "ListNode.h"

@implementation Q92ReverseLinkedListII

//Difficulty: medium
//TAG: Facebook
//TAG: linked list

/**
 * 92. Reverse Linked List II
 * Reverse a linked list from position m to n. Do it in one-pass.
 *
 * Note: 1 ≤ m ≤ n ≤ length of list.
 *
 * Example:
 *
 * Input: 1->2->3->4->5->NULL, m = 2, n = 4
 * Output: 1->4->3->2->5->NULL
 */

/*
 Solution:
 
 skip to m node, then reverse until n node
 
 Time: O(n)
 Space: O(1)
 */

- (ListNode *)reverseBetween: (ListNode *)head m: (NSInteger)m n: (NSInteger)n {
    ListNode *dummy = [[ListNode alloc]init:0], *temp = dummy;
    dummy.next = head;
    while (m-- > 1 && temp != nil) {
        temp = temp.next;
        m--;
        n--;
    }
    if (!temp) return dummy.next;
    ListNode *start = temp.next, *end = start, *pre = nil;
    while (n-- > 0 && start) {
        ListNode *next = start.next;
        start.next = pre;
        pre = start;
        start = next;
    }
    temp.next = pre;
    end.next = start;
    return dummy.next;
}

@end
