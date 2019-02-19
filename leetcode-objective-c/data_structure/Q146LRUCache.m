//
//  Q146LRUCache.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q146LRUCache.h"

@interface Q146LRUCache()

@property (nonatomic) NSMutableDictionary<NSNumber *, DoublyListNode *> *dict;
@property (nonatomic) DoublyListNode *head;
@property (nonatomic) DoublyListNode *tail;
@property (nonatomic, assign) NSInteger capacity;

@end

@implementation Q146LRUCache

//TAG: Google
//TAG: Facebook
//TAG: Microsoft
//TAG: Amazon
//TAG: Uber
//TAG: Snap
//TAG: Apple
//TAG: Data structure
//Difficulty: Hard

/**
 146. LRU Cache
 Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
 
 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
 
 Follow up:
 Could you do both operations in O(1) time complexity?
 
 Example:
 
 LRUCache cache = new LRUCache( 2  capacity );
 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.put(4, 4);    // evicts key 1
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4
 */

/*
 * Solution:
 *
 * Use Doubly linkedList, used when delete LRU and insert
 * Use HashMap for get O(1)
 */

- (instancetype)initWithCapacity: (NSInteger)capacity
{
    self = [super init];
    if (self) {
        _capacity = capacity;
        _dict = [NSMutableDictionary new];
        _head = [[DoublyListNode alloc]initWithKey:0 val:0];
        _tail = [[DoublyListNode alloc]initWithKey:0 val:0];
        _head.next = _tail;
        _tail.pre = _head;
    }
    return self;
}

- (NSInteger)get: (NSInteger)key {
    DoublyListNode *node = self.dict[@(key)];
    if (node) {
        [self delete:node];
        [self insertInFront:node];
        return node.val;
    } else return -1;
}

- (void)put: (NSInteger)key value: (NSInteger)value {
    DoublyListNode *node = self.dict[@(key)];
    if (node) {
        node.val = value;
        [self delete:node];
        [self insertInFront:node];
    } else {
        node = [[DoublyListNode alloc]initWithKey:key val:value];
        self.dict[@(key)] = node;
        [self insertInFront:node];
        self.capacity--;
        if (self.capacity < 0) {
            if (![self.tail.pre isEqualTo:self.head]) {
                DoublyListNode *pre = self.tail.pre;
                [self delete:pre];
                [self.dict removeObjectForKey:@(pre.key)];
                self.capacity++;
            }
        }
    }
}

//Do not put delete() at beginning of insertInFront(), because we cannot delete() when insert a new node
- (void)insertInFront: (DoublyListNode *)node {
    DoublyListNode *next = self.head.next;
    self.head.next = node;
    node.pre = self.head;
    node.next = next;
    next.pre = node;
}

- (void)delete: (DoublyListNode *)node {
    node.pre.next = node.next;
    node.next.pre = node.pre;
}

@end

@implementation DoublyListNode

- (instancetype)initWithKey: (NSInteger)key val: (NSInteger)val
{
    self = [super init];
    if (self) {
        _key = key;
        _val = val;
    }
    return self;
}

@end
