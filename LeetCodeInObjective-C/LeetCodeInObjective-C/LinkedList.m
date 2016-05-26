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

@end
