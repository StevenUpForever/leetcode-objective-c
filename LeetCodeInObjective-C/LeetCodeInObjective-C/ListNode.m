//
//  ListNode.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/15/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode

- (instancetype)initWithVal: (NSInteger)x
{
    self = [super init];
    if (self) {
        _val = x;
    }
    return self;
}

@end

@implementation TreeNode

- (instancetype)initWithVal: (NSInteger)val
{
    self = [super init];
    if (self) {
        _val = val;
    }
    return self;
}

@end
