//
//  Q297SerializeAndDeserializeBinaryTree.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/12/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TreeNode;
@interface Q297SerializeAndDeserializeBinaryTree : NSObject

- (NSString *)serialize: (TreeNode *)root;
- (TreeNode *)deserialize: (NSString *)data;

@end

NS_ASSUME_NONNULL_END
