//
//  Tree.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/26/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Tree.h"

@implementation Tree

- (TreeNode *)searchBinarySearchTree: (TreeNode *)node target: (NSInteger)target {
    if(node == nil) return nil;
    if (node.val == target) return node;
    else if (node.val < target) return [self searchBinarySearchTree:node.rightNode target:target];
    else return [self searchBinarySearchTree:node.leftNode target:target];
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
