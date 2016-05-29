//
//  Problem101To110.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/28/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TreeNode;
@interface Problem101To110 : NSObject

- (NSArray *)levelOrder: (TreeNode *)root;

- (NSInteger)maxDepth: (TreeNode *)root;

@end
