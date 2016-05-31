//
//  Problem31To40.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/28/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Problem31To40 : NSObject

- (NSInteger)search: (NSArray *)A  target: (NSNumber *)target;
- (BOOL)isValidSudoku: (NSArray<NSArray<NSString *> *> *)board;

@end
