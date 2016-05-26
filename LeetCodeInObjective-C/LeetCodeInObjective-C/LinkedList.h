//
//  LinkedList.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/26/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListNode;
@interface LinkedList : NSObject

- (ListNode *)searchLinkedList: (ListNode *)node target: (NSInteger)val;

@end
