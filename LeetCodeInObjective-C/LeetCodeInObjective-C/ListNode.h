//
//  ListNode.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/15/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListNode : NSObject

@property (nonatomic, assign) NSInteger val;
@property (nonatomic) ListNode *next;

- (instancetype)initWithVal: (NSInteger)x;

@end

@interface TreeNode : NSObject

@property (nonatomic, assign) NSInteger val;
@property (nonatomic) TreeNode *left;
@property (nonatomic) TreeNode *right;

@end
