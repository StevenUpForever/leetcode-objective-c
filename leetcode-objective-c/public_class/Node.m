//
//  Node.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithVal:(NSInteger)val left: (Node *)left right: (Node *)right
{
    self = [super init];
    if (self) {
        _val = val;
        _left = left;
        _right = right;
    }
    return self;
}

@end
