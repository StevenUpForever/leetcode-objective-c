//
//  Q236LowestCommonAncestorOfABinaryTree.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/21/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q236LowestCommonAncestorOfABinaryTree.h"
#import "TreeNode.h"

@implementation Q236LowestCommonAncestorOfABinaryTree

//TAG: Facebook
//TAG: Microsoft
//TAG: Amazon
//TAG: LinkedIn
//TAG: Apple
//TAG: Tree
//TAG: Bottom up
//Difficulty: Medium

/**
 * 236. Lowest Common Ancestor of a Binary Tree
 * Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
 
 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes v and w as the lowest node in T that has both v and w as descendants (where we allow a node to be a descendant of itself).”
 
 _______3______
 /              \
 ___5__          ___1__
 /      \        /      \
 6      _2       0       8
 /  \
 7   4
 For example, the lowest common ancestor (LCA) of nodes 5 and 1 is 3. Another example is LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
 */

/*
 * Solution:
 * Classic back track problem
 * What to know at this node: the LCA from left node and right node
 * Report to upper level: LCA from this node
 *
 * Time: O(n) visit every node once
 * Space: O(n) if not balanced
 */

- (TreeNode *)lowestCommonAncestor: (TreeNode *)root p: (TreeNode *)p q: (TreeNode *)q {
    if (!root || root == p || root == q) {
        return root;
    }
    TreeNode *left = [self lowestCommonAncestor:root.left p:p q:q],
    *right = [self lowestCommonAncestor:root.right p:p q:q];
    if (left && right) return root;
    return left ? left : right;
}

@end
