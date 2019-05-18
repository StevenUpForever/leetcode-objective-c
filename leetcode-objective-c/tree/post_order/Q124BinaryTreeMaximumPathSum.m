//
//  Q124BinaryTreeMaximumPathSum.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q124BinaryTreeMaximumPathSum.h"
#import "TreeNode.h"

@interface Q124BinaryTreeMaximumPathSum()

@property (nonatomic, assign) NSInteger max;

@end

@implementation Q124BinaryTreeMaximumPathSum

//TAG: Microsoft
//TAG: Baidu
//TAG: Google
//TAG: tree
//TAG: bottom up
//Difficulty: hard

/**
 * 124. Binary Tree Maximum Path Sum
 * Given a non-empty binary tree, find the maximum path sum.
 *
 * For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.
 *
 * Example 1:
 *
 * Input: [1,2,3]
 *
 *        1
 *       / \
 *      2   3
 *
 * Output: 6
 * Example 2:
 *
 * Input: [-10,9,20,null,null,15,7]
 *
 *    -10
 *    / \
 *   9  20
 *     /  \
 *    15   7
 *
 * Output: 42
 */

/*
 Solution:
 Post order traversal binary tree, for each level:
 we know maxSum from left and right, and current value
 if left or right maxSum < 0, just use 0, which means use no node from that side
 update maxValue with left + right + cur, cannot ignore cur, because cur may < 0 but we need at least one node
 then report max left or right value + cur to upper value
 
 Time: O(n)
 Space: O(n)
 */

- (NSInteger)maxPathSum: (TreeNode *)root {
    self.max = NSIntegerMin;
    [self helper:root];
    return self.max;
}

- (NSInteger)helper: (TreeNode *)root {
    if (!root) return 0;
    NSInteger left = [self maxPathSum:root.left], right = [self maxPathSum:root.right];
    self.max = MAX(self.max, left + right + root.val);
    return MAX(left, right) + root.val;
}

@end
