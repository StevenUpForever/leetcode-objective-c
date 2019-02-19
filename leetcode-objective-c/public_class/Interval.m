//
//  Interval.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Interval.h"

@implementation Interval

- (instancetype)init
{
    self = [super init];
    if (self) {
        _start = 0;
        _end = 0;
    }
    return self;
}

- (instancetype)initWithStart: (NSInteger) start end: (NSInteger)end
{
    self = [super init];
    if (self) {
        _start = start;
        _end = end;
    }
    return self;
}

@end
