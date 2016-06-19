//
//  Problem201Tp210.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 6/19/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem201Tp210.h"
#import "ListNode.h"

@implementation Problem201Tp210

/*
 206. Reverse Linked List
 Reverse a singly linked list.
 */
- (ListNode *)reverseList: (ListNode *)head {
    ListNode *node;
    while (head != nil) {
        ListNode *next = head.next;
        head.next = node;
        node = head;
        head = next;
    }
    return node;
}

@end
