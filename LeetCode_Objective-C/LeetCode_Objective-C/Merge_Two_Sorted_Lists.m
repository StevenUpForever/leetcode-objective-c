//
//  Merge_Two_Sorted_Lists.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/19/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Merge_Two_Sorted_Lists.h"
#import "ListNode.h"

@implementation Merge_Two_Sorted_Lists

/**
 * 21. Merge Two Sorted Lists
 * Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 */

/**
 * Solution:
 * Create a dummy node, merge two list to dummy node list and return dummy node
 */

- (ListNode *)mergeTwoLists: (ListNode *)l1 l2: (ListNode *)l2 {
    ListNode *dummy = [[ListNode alloc]init:0];
    ListNode *res = dummy;
    while (l1 != nil && l2 != nil) {
        if (l1.val < l2.val) {
            dummy.next = l1;
            l1 = l1.next;
        } else {
            dummy.next = l2;
            l2 = l2.next;
        }
        dummy = dummy.next;
    }
    if (l1 != nil) dummy.next = l1;
    if (l2 != nil) dummy.next = l2;
    return res;
}

@end
