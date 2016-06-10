//
//  Problem141To150.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/29/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem141To150.h"
#import "ListNode.h"

@implementation Problem141To150

/*
 141. Linked List Cycle
 Given a linked list, determine if it has a cycle in it.
 
 Follow up:
 Can you solve it without using extra space?
 */
- (BOOL)hasCycle: (ListNode *)head {
    ListNode *slow = head;
    ListNode *fast = head;
    while (fast.next != nil && fast.next.next != nil) {
        slow = slow.next;
        fast = fast.next.next;
        if (slow == fast) {
            return YES;
        }
    }
    return NO;
}

//- (BOOL)hasCycle: (ListNode *)head {
//    if (head == nil) return NO;
//    NSMutableDictionary *tagDict = [[NSMutableDictionary alloc]init];
//    while (head != nil) {
//        if (tagDict[head.description] == nil) {
//            [tagDict setObject:@1 forKey:head.description];
//            continue;
//        } else return YES;
//        head = head.next;
//    }
//    return NO;
//}


@end
    

/*
 146. LRU Cache
 Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and set.
 
 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 set(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
 */
@interface LRUCache()

@property (nonatomic, assign) NSInteger capacity;
@property (nonatomic, assign) NSInteger total;
@property (nonatomic) doubleLinkedNode *head;
@property (nonatomic) doubleLinkedNode *tail;
@property (nonatomic) NSMutableDictionary<NSNumber *, doubleLinkedNode *> *dict;

@end

@implementation LRUCache

- (instancetype)initWithCapacity: (NSInteger)capacity
{
    self = [super init];
    if (self) {
        _capacity = capacity;
        _total = 0;
        _dict = [[NSMutableDictionary alloc]init];
        _head = [[doubleLinkedNode alloc]initWithKey:0 andValue:0];
        _tail = [[doubleLinkedNode alloc]initWithKey:0 andValue:0];
        self.head.next = self.tail;
        self.head.pre = nil;
        self.tail.pre = self.head;
        self.tail.next = nil;
    }
    return self;
}

- (NSInteger)get: (NSInteger)key {
    doubleLinkedNode *node = [self.dict objectForKey:[NSNumber numberWithInteger:key]];
    if (node == nil) return -1;
    [self removeNode:node];
    [self insertNode:node];
    return node.value;
}

- (void)set: (NSInteger)key andValue: (NSInteger)value {
    doubleLinkedNode *node = [self.dict objectForKey:[NSNumber numberWithInteger:key]];
    if (node != nil) {
        node.value = value;
        [self removeNode:node];
        [self insertNode:node];
    } else {
        node = [[doubleLinkedNode alloc]initWithKey:key andValue:value];
        [self.dict setObject:node forKey:[NSNumber numberWithInteger:key]];
        [self insertNode:node];
        self.total++;
        if (self.total > self.capacity) {
            [self.dict removeObjectForKey:[NSNumber numberWithInteger:self.tail.pre.key]];
            [self removeNode:self.tail.pre];
            self.total--;
        }
    }
}

- (void)removeNode: (doubleLinkedNode *)node {
    node.pre.next = node.next;
    node.next.pre = node.pre;
}

- (void)insertNode: (doubleLinkedNode *)node {
    node.pre = self.head;
    node.next = self.head.next;
    self.head.next.pre = node;
    self.head.next = node;
}

@end

@implementation doubleLinkedNode

- (instancetype)initWithKey: (NSInteger)key andValue: (NSInteger)value
{
    self = [super init];
    if (self) {
        _key = key;
        _value = value;
    }
    return self;
}

@end
