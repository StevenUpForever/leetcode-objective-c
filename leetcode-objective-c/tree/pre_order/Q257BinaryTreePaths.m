//
//  Q257BinaryTreePaths.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q257BinaryTreePaths.h"
#import "TreeNode.h"

@implementation Q257BinaryTreePaths

//TAG: Google
//TAG: Facebook
//TAG: Apple
//TAG: tree
//Difficulty: Easy

/**
 * 257. Binary Tree Paths
 * Given a binary tree, return all root-to-leaf paths.
 *
 * For example, given the following binary tree:
 *
 *    1
 *  /   \
 * 2     3
 *  \
 *   5
 * All root-to-leaf paths are:
 *
 * ["1->2->5", "1->3"]
 */

/*
 * Solution:
 * Pre order traversal, append value and -> (if needed) to string, and recursion to left and right
 *
 * Better use string instead of stringBuilder and delete in call stack, due to number may be more than one digit
 * and may neg number, so when became string the length may not be 1 and hard to delete
 *
 * Time: O(n)
 * Space: O(n)
 */

- (NSArray<NSString *> *)binaryTreePaths: (TreeNode *)root {
    NSMutableArray<NSString *> *res = [NSMutableArray new];
    [self preOrder:root str:@"" arr:res];
    return [res copy];
}

- (void)preOrder: (TreeNode *)root str: (NSString *)str arr: (NSMutableArray<NSString *> *)arr {
    if (!root) {
        [arr addObject:str];
        return;
    }
    NSMutableString *mut = [str mutableCopy];
    if (mut.length > 0) [mut appendString:@"->"];
    [mut appendFormat:@"%li", root.val];
    [self preOrder:root.left str:[mut copy] arr:arr];
    [self preOrder:root.right str:[mut copy] arr:arr];
}

@end
