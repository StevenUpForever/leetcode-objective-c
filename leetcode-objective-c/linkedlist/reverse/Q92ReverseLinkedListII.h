//
//  Q92ReverseLinkedListII.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ListNode;
@interface Q92ReverseLinkedListII : NSObject

- (ListNode *)reverseBetween: (ListNode *)head m: (NSInteger)m n: (NSInteger)n;

@end

NS_ASSUME_NONNULL_END
