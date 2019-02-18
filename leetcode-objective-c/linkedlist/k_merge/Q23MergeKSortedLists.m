//
//  Merge_k_Sorted_Lists.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/19/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Q23MergeKSortedLists.h"
#import "ListNode.h"

@implementation Q23MergeKSortedLists

/**
 * 23. Merge k Sorted Lists
 * Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
 */

/*
 * Solution 1: Binary reduction
 * treat these lists as an array, and do merge sort about this array, merge each two lists together
 * When not consider the I/O speed, this should be the one of the fastest way
 * When consider about I/O, each time when merge two lists, need to read these two lists from memory, the actual time is more slower than a merge sort
 * Theoretically time: n represent the length of lists array, m represent the average length of list, O(nlogn * 2m) = O(mnlogn)
 * If each step, merge two list to one list, it's the same as iteration, the time is O(2mn) = O(mn) ***not consider I/O performance***
 * Space: O(logn)
 */

/*
 * Solution 2: iteration
 * merge list from the first to the end
 * Same I/O performance issue as the binary reduction
 * Time: n represent the length of lists array, m represent the average length of list, O(mn) ***not consider I/O performance***
 * Space: O(1)
 */

- (ListNode *)mergeKListsS2: (NSArray<ListNode *> *)lists {
    if (lists.count == 0) return nil;
    ListNode *res = lists[0];
    for (NSInteger i = 1; i < lists.count; i++) {
        ListNode *dummy = [[ListNode alloc]init:0];
        ListNode *temp = dummy, *l1 = res, *l2 = lists[i];
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
        res = temp.next;
    }
    return res;
}

/*
 * Solution 3: Priority queue
 * push all list node into queue (merge to a dummy node at the same time)
 * Time: O(mnlogn) logn is the sort in a heap for n nodes at one time in the heap (each time need to poll a node and push a new one into it, max n nodes)
 */

@end
