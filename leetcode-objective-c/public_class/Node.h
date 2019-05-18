//
//  Node.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property (nonatomic, assign) NSInteger val;
@property (nonatomic) Node *left;
@property (nonatomic) Node *right;

- (instancetype)initWithVal:(NSInteger)val left: (Node *)left right: (Node *)right;

@end

NS_ASSUME_NONNULL_END
