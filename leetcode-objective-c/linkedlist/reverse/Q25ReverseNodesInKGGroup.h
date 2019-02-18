//
//  Reverse_Nodes_in_kGroup.h
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/21/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListNode;
@interface Q25ReverseNodesInKGGroup : NSObject

- (ListNode *)reverseKGroupS1: (ListNode *)head k: (NSInteger)k;
- (ListNode *)reverseKGroupS2: (ListNode *)head k: (NSInteger)k;

@end
