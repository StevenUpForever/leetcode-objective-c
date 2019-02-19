//
//  Q528RandomPickWithWeight.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Q528RandomPickWithWeight : NSObject

- (instancetype)init: (NSArray<NSNumber *> *)w;
- (NSInteger)pickIndex;

@end

NS_ASSUME_NONNULL_END
