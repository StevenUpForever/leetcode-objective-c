//
//  Q127WordLadder.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Q127WordLadder : NSObject

- (NSInteger)ladderLength: (NSString *)beginWord endWord: (NSString *)endWord wordList: (NSArray<NSString *> *)wordList;

@end

NS_ASSUME_NONNULL_END
