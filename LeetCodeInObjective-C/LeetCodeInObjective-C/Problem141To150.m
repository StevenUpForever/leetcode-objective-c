//
//  Problem141To150.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/29/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem141To150.h"

@implementation Problem141To150


@end
    

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
