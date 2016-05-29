//
//  Problem21To30.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/29/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem21To30.h"
#import "ListNode.h"

@implementation Problem21To30

/*
 23. Merge k Sorted Lists
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
 */
- (ListNode *)mergeKLists: (NSArray<ListNode *> *)lists {
    if (lists == nil || lists.count == 0) return nil;
    return [self partition:lists start:0 end:lists.count - 1];
}

- (ListNode *)partition: (NSArray<ListNode *> *)lists start: (NSInteger)start end: (NSInteger)end {
    if (start < end) {
        NSInteger middle = (start + end)/2;
        ListNode *node1 = [self partition:lists start:start end:middle];
        ListNode *node2 = [self partition:lists start:middle + 1 end:end];
        return [self mergeList:node1 andNode2:node2];
    }
    return lists[start];
}

- (ListNode *)mergeList: (ListNode *)node1 andNode2: (ListNode *)node2 {
    ListNode *result = [[ListNode alloc]initWithVal:0];
    result.next = node1;
    ListNode *temp = result;
    while (node1 != nil && node2 != nil) {
        if (node1.val < node2.val) node1 = node1.next;
        else {
            temp.next = node2;
            ListNode *next = node2.next;
            node2.next = node1;
            node2 = next;
        }
        temp = temp.next;
    }
    if (node2 != nil) temp.next = node2;
    return result.next;
}

@end
