//
//  Q426ConvertBinarySearchTreeToSortedDoublyLinkedList.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Node;
@interface Q426ConvertBinarySearchTreeToSortedDoublyLinkedList : NSObject

- (Node *)treeToDoublyList: (Node *)root;

@end

NS_ASSUME_NONNULL_END
