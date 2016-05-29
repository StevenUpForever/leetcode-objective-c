//
//  Tree.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/26/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Tree.h"
#import "ListNode.h"

@implementation Tree

- (TreeNode *)searchBinarySearchTree: (TreeNode *)node target: (NSInteger)target {
    if(node == nil) return nil;
    if (node.val == target) return node;
    else if (node.val < target) return [self searchBinarySearchTree:node.right target:target];
    else return [self searchBinarySearchTree:node.left target:target];
}

- (TreeNode *)minimumNode: (TreeNode *)node {
    if (node == nil) return nil;
    while (node.left != nil) {
        node = node.left;
    }
    return node;
}

- (TreeNode *)maximumNode: (TreeNode *)node {
    if (node == nil) return nil;
    while (node.right != nil) {
        node = node.right;
    }
    return node;
}



@end
