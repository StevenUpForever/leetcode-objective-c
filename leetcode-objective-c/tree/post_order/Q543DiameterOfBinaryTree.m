//
//  Q543DiameterOfBinaryTree.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q543DiameterOfBinaryTree.h"
#import "TreeNode.h"

@interface Q543DiameterOfBinaryTree()

@property (nonatomic, assign) NSInteger res;

@end

@implementation Q543DiameterOfBinaryTree

//TAG: Google
//TAG: Facebook
//TAG: tree
//TAG: bottom up
//Difficulty: Easy

/**
 * 543. Diameter of Binary Tree
 * Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
 *
 * Example:
 * Given a binary tree
 *           1
 *          / \
 *         2   3
 *        / \
 *       4   5
 * Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].
 *
 * Note: The length of path between two nodes is represented by the number of edges between them.
 */

/*
 * Solution:
 * Going to need max length from left subtree and right subtree, l + r + 1 is current max length until current
 * node as root, update max length, return max left or right + 1 to above level
 *
 * Time: O(n)
 * Space: O(n)
 */

- (NSInteger)diameterOfBinaryTree: (TreeNode *)root {
    self.res = 0;
    [self postOrder:root];
    return self.res;
}

- (NSInteger)postOrder: (TreeNode *)root {
    if (!root) return 0;
    NSInteger left = [self postOrder:root.left], right = [self postOrder:root.right];
    self.res = MAX(self.res, left + right);
    return MAX(left, right) + 1;
}

@end
