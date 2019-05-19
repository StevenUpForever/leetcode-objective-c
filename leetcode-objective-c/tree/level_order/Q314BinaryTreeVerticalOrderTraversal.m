//
//  Q314BinaryTreeVerticalOrderTraversal.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/19/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q314BinaryTreeVerticalOrderTraversal.h"
#import "TreeNode.h"

@interface Q314BinaryTreeVerticalOrderTraversal()

@property (nonatomic, assign) NSInteger min;
@property (nonatomic, assign) NSInteger max;

@end

@implementation Q314BinaryTreeVerticalOrderTraversal

//TAG: Google
//TAG: Facebook
//TAG: Tree
//TAG: Up down
//Difficulty: Medium

/**
 * 314. Binary Tree Vertical Order Traversal
 * Given a binary tree, return the vertical order traversal of its nodes' values. (ie, from top to bottom, column by column).
 
 If two nodes are in the same row and column, the order should be from left to right.
 
 Examples:
 
 Given binary tree [3,9,20,null,null,15,7],
 3
 /\
 /  \
 9  20
 /\
 /  \
 15   7
 return its vertical order traversal as:
 [
 [9],
 [3,15],
 [20],
 [7]
 ]
 Given binary tree [3,9,8,4,0,1,7],
 3
 /\
 /  \
 9   8
 /\  /\
 /  \/  \
 4  01   7
 return its vertical order traversal as:
 [
 [4],
 [9],
 [3,0,1],
 [8],
 [7]
 ]
 Given binary tree [3,9,8,4,0,1,7,null,null,null,2,5] (0's right child is 2 and 1's left child is 5),
 3
 /\
 /  \
 9   8
 /\  /\
 /  \/  \
 4  01   7
 /\
 /  \
 5   2
 return its vertical order traversal as:
 [
 [4],
 [9,5],
 [3,0,1],
 [8,2],
 [7]
 ]
 */

/*
 * Solution 1:
 * BFS, don't need record level, due to level from low to high, just record index
 *
 * Time: O(n)
 * Space: O(1)
 */

- (NSArray *)verticalOrder: (TreeNode *)root {
    self.min = 0;
    self.max = 0;
    NSMutableDictionary<NSNumber *, NSMutableArray<NSNumber *> *> *arrs = [NSMutableDictionary new];
    [self preOrder:root dict:arrs levelDict:[NSMutableDictionary new] index:0 level:0];
    NSMutableArray *res = [NSMutableArray new];
    for (NSInteger index = self.min; index <= self.max; index++) {
        [res addObject:[arrs[@(index)] copy]];
    }
    return [res copy];
}

- (void)preOrder: (TreeNode *)root dict: (NSMutableDictionary<NSNumber *, NSMutableArray<NSNumber *> *> *)dict
       levelDict: (NSMutableDictionary<NSNumber *, NSMutableArray<NSNumber *> *> *)levelDict
           index: (NSInteger)index
           level: (NSInteger)level {
    if (!root) return;
    self.min = MIN(self.min, index);
    self.max = MAX(self.max, index);
    if (!dict[@(index)]) dict[@(index)] = [NSMutableArray new];
    if (!levelDict[@(index)]) levelDict[@(index)] = [NSMutableArray new];
    NSInteger i = 0;
    NSMutableArray<NSNumber *> *indexArr = dict[@(index)], *levelArr = levelDict[@(index)];
    for (; i < levelArr.count; i++) {
        if (levelArr[i].integerValue > level) break;
    }
    [indexArr insertObject:@(root.val) atIndex:i];
    [levelArr insertObject:@(level) atIndex:i];
    [self preOrder:root.left dict:dict levelDict:levelDict index:index - 1 level:level + 1];
    [self preOrder:root.right dict:dict levelDict:levelDict index:index + 1 level:level + 1];
}

@end
