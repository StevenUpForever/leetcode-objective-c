//
//  Problem141To150.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/29/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListNode;
@interface Problem141To150 : NSObject

- (BOOL)hasCycle: (ListNode *)head;

@end

@interface LRUCache : NSObject

- (instancetype)initWithCapacity: (NSInteger)capacity;

- (NSInteger)get: (NSInteger)key;
- (void)set: (NSInteger)key andValue: (NSInteger)value;

@end

@interface doubleLinkedNode : NSObject

@property (nonatomic, assign) NSInteger key;
@property (nonatomic, assign) NSInteger value;

@property (nonatomic) doubleLinkedNode *pre;
@property (nonatomic) doubleLinkedNode *next;

- (instancetype)initWithKey: (NSInteger)key andValue: (NSInteger)value;

@end