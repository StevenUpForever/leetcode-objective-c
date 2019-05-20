//
//  Q785IsGraphBipartite.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/19/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Q785IsGraphBipartite : NSObject

- (BOOL)isBipartite: (NSArray<NSArray<NSNumber *> *> *)graph;
- (BOOL)isBipartite2: (NSArray<NSArray<NSNumber *> *> *)graph;

@end

NS_ASSUME_NONNULL_END
