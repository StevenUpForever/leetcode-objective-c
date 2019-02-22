//
//  Q236LowestCommonAncestorOfABinaryTree.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/21/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TreeNode;
@interface Q236LowestCommonAncestorOfABinaryTree : NSObject

- (TreeNode *)lowestCommonAncestor: (TreeNode *)root p: (TreeNode *)p q: (TreeNode *)q;

@end

NS_ASSUME_NONNULL_END
