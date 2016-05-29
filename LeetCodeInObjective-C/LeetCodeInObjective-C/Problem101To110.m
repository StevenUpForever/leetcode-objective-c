//
//  Problem101To110.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/28/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem101To110.h"
#import "ListNode.h"

@implementation Problem101To110

/*
 102. Binary Tree Level Order Traversal
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
 For example:
 Given binary tree {3,9,20,#,#,15,7},
 3
 / \
 9  20
 /  \
 15   7
 return its level order traversal as:
 [
 [3],
 [9,20],
 [15,7]
 ]
 confused what "{1,#,2,3}" means? > read more on how binary tree is serialized on OJ.
 
 
 OJ's Binary Tree Serialization:
 The serialization of a binary tree follows a level order traversal, where '#' signifies a path terminator where no node exists below.
 
 Here's an example:
 1
 / \
 2   3
 /
 4
 \
 5
 The above binary tree is serialized as "{1,2,3,#,#,4,#,#,5}".
 */
- (NSArray *)levelOrder: (TreeNode *)root {
    if (root == nil) return nil;
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    [self currentNodes:resultArray node:root currentHeight:0];
    return resultArray;
}

- (void)currentNodes: (NSMutableArray *)resultArray node: (TreeNode *)root currentHeight: (NSInteger)height {
    if (root == nil) return;
    if (height >= resultArray.count) [resultArray addObject:[[NSMutableArray alloc]init]];
    [resultArray[height] addObject:[NSNumber numberWithInteger:root.val]];
    [self currentNodes:resultArray node:root.left currentHeight:height + 1];
    [self currentNodes:resultArray node:root.right currentHeight:height + 1];
}

@end
