//
//  Q146LRUCache.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Q146LRUCache : NSObject

- (instancetype)initWithCapacity: (NSInteger)capacity;
- (NSInteger)get: (NSInteger)key;
- (void)put: (NSInteger)key value: (NSInteger)value;

@end

@interface DoublyListNode : NSObject

@property (nonatomic) DoublyListNode *pre;
@property (nonatomic) DoublyListNode *next;
@property (nonatomic, assign) NSInteger key;
@property (nonatomic, assign) NSInteger val;

- (instancetype)initWithKey: (NSInteger)key val: (NSInteger)val;

@end

NS_ASSUME_NONNULL_END
