//
//  Problem131To140.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/29/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class randomListNode;
@interface Problem131To140 : NSObject

- (randomListNode *)copyRandomList: (randomListNode *)head;

@end

@interface randomListNode : NSObject

@property (nonatomic, assign) NSInteger val;
@property (nonatomic) randomListNode *next;
@property (nonatomic) randomListNode *random;

- (instancetype)initWithVal: (NSInteger)val;

@end
