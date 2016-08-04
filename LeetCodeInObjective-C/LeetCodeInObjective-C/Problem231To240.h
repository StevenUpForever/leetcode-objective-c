//
//  Problem231To240.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 6/3/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListNode;
@interface Problem231To240 : NSObject

- (BOOL)isPowerOfTwo: (int)n;
- (void)deleteNode: (ListNode *)node;
- (NSArray *)productExceptSelf: (NSArray *)nums;
- (BOOL)searchMatrix: (NSArray<NSArray *> *)matrix target: (NSNumber *)target;

@end
