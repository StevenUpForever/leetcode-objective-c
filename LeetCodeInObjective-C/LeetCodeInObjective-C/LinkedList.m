//
//  LinkedList.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/26/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "LinkedList.h"
#import "ListNode.h"

@implementation LinkedList

- (ListNode *)searchLinkedList: (ListNode *)node target: (NSInteger)val {
    if (node == nil) return nil;
    if (node.val == val) return node;
    else return [self searchLinkedList:node.next target:val];
}

- (void)insertNodeAtFirst: (ListNode *)old val:(NSInteger)val {
    ListNode *newNode = [[ListNode alloc]initWithVal:val];
    newNode.next = old;
    //Replace the first node in the list with the new node
    old = newNode;
}

- (void)deleteNode: (ListNode *)node target: (NSInteger)val {
    if (node == nil) return;
    if (node.val == val) {
        node = nil;
        return;
    }
    while (node.next != nil) {
        if (node.next.val == val) {
            node.next = node.next.next;
            return;
        }
        node = node.next;
    }
}

@end
