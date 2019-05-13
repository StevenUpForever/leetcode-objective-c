//
//  TreeNode.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/21/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

@property (nonatomic, assign) NSInteger val;
@property (nonatomic) TreeNode *left;
@property (nonatomic) TreeNode *right;

- (instancetype)initWithVal: (NSInteger)val;

@end

NS_ASSUME_NONNULL_END
