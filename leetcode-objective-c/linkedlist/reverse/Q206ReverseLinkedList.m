//
//  Q206ReverseLinkedList.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/13/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q206ReverseLinkedList.h"
#import "ListNode.h"

@implementation Q206ReverseLinkedList

//TAG: Facebook
//TAG: Microsoft
//TAG: Amazon
//TAG: Apple
//TAG: Uber
//TAG: LinkedList
//TAG: Recursion
//Difficulty: Easy

/**
 * 206. Reverse Linked List
 * Reverse a singly linked list.
 
 click to show more hints.
 
 Hint:
 A linked list can be reversed either iteratively or recursively. Could you implement both?
 */

/*
 * Solution 1: Iterative
 * keep track of pre node and cur node, loop the list, every time
 *      keep track of cur.next temporarily, point cur.next = pre, then parallelly move pre to cur, cur to next
 * Until cur = null, at this time, pre is the last node of list, means the head of new reversed list, return pre
 *
 * Time: O(n)
 * Space: O(1)
 */

- (ListNode *)reverse: (ListNode *)head {
    ListNode *pre = nil;
    while (head) {
        ListNode *next = head.next;
        head.next = pre;
        pre = head;
        head = next;
    }
    return pre;
}

/*
 * Solution 2: recursion
 * 1. find the end of the list recursively, this end node will be the begin node of reversed list
 * 2. at track back steps, point cur next.next = head, head.next = null
 *
 * Time: O(n)
 * Space: O(n)
 */

- (ListNode *)reverse2: (ListNode *)head {
    if (!head || !head.next) return head;
    ListNode *next = head.next;
    ListNode *res = [self reverse2:next];
    next.next = head;
    head.next = nil;
    return res;
}

@end
