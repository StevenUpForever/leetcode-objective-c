//
//  Problem131To140.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/29/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem131To140.h"

@implementation Problem131To140

/*
 138. Copy List with Random Pointer
A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.

Return a deep copy of the list.
*/
- (randomListNode *)copyRandomList: (randomListNode *)head {
    randomListNode *result = [[randomListNode alloc]initWithVal:0];
    randomListNode *temp = result;
    randomListNode *tempHead = head;
    NSMutableArray *array1 = [[NSMutableArray alloc]init];
    NSMutableArray *array2 = [[NSMutableArray alloc]init];
    while (tempHead != nil) {
        temp.next = [[randomListNode alloc]initWithVal:tempHead.val];
        temp = temp.next;
        [array1 addObject:temp];
        [array2 addObject:tempHead];
        tempHead = tempHead.next;
    }
    temp = result.next;
    tempHead = head;
    while (tempHead != nil) {
        if (tempHead.random != nil) temp.random = array1[[array2 indexOfObject:tempHead.random]];
        tempHead = tempHead.next;
        temp = temp.next;
    }
    return result.next;
}

@end

@implementation randomListNode

- (instancetype)initWithVal: (NSInteger)val
{
    self = [super init];
    if (self) {
        _val = val;
    }
    return self;
}

@end
