//
//  ListNode.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/10/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode

- (instancetype)init: (NSInteger)x
{
    self = [super init];
    if (self) {
        _val = x;
    }
    return self;
}

@end
