//
//  Problem151To160.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/24/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Problem151To160 : NSObject

- (NSString *)reverseWords: (NSString *)input;

@end

@interface MinStack : NSObject

- (void)push: (NSInteger)x;
- (void)pop;
- (NSInteger)top;
- (NSInteger)getMin;

@end
