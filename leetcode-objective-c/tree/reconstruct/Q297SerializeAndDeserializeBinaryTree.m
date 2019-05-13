//
//  Q297SerializeAndDeserializeBinaryTree.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/12/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q297SerializeAndDeserializeBinaryTree.h"
#import "TreeNode.h"

@implementation Q297SerializeAndDeserializeBinaryTree

//TAG: Google
//TAG: Facebook
//TAG: Microsoft
//TAG: Amazon
//TAG: Uber
//TAG: LinkedIn
//TAG: Breadth first search
//Difficulty: Hard

/**
 * 297. Serialize and Deserialize Binary Tree
 * Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
 
 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.
 
 For example, you may serialize the following tree
 
 1
 / \
 2   3
 / \
 4   5
 as "[1,2,3,null,null,4,5]", just the same as how legacy_code OJ serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.
 
 
 
 Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
 
 Credits:
 Special thanks to @Louis1992 for adding this problem and creating all test cases.
 */

/**
 Solution: level order traversal or pre order traversal
 */

- (NSString *)serialize: (TreeNode *)root {
    NSMutableString *mut = [NSMutableString new];
    [self buildString:root str:mut];
    return [mut copy];
}

- (void)buildString: (TreeNode *)node str: (NSMutableString *)str {
    if (!node) {
        [str appendFormat:@"X"];
        [str appendString:@","];
        return;
    }
    [str appendFormat:@"%li", node.val];
    [self buildString:node.left str:str];
    [self buildString:node.right str:str];
}

- (TreeNode *)deserialize: (NSString *)data {
    NSArray<NSString *> *arr = [data componentsSeparatedByString:@","];
    return [self buildTree:[arr mutableCopy]];
}

- (TreeNode *)buildTree: (NSMutableArray<NSString *> *)arr {
    if (arr.count == 0) return nil;
    NSString *str = arr.lastObject;
    [arr removeLastObject];
    if ([str isEqualToString:@"X"]) return nil;
    NSInteger val = [str integerValue];
    TreeNode *node = [[TreeNode alloc]initWithVal:val];
    node.right = [self buildTree:arr];
    node.left = [self buildTree:arr];
    return node;
}

@end
