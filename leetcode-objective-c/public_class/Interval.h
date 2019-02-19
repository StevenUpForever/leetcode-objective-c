//
//  Interval.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Interval : NSObject

@property (nonatomic, assign) NSInteger start;
@property (nonatomic, assign) NSInteger end;

- (instancetype)initWithStart: (NSInteger) start end: (NSInteger)end;

@end

NS_ASSUME_NONNULL_END
