//
//  TreeNode.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/21/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "TreeNode.h"

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
