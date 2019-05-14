//
//  Q206ReverseLinkedList.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/13/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ListNode;
@interface Q206ReverseLinkedList : NSObject

- (ListNode *)reverse: (ListNode *)head;
- (ListNode *)reverse2: (ListNode *)head;

@end

NS_ASSUME_NONNULL_END
