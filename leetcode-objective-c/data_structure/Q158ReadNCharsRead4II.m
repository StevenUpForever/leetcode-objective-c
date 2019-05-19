//
//  Q158ReadNCharsRead4II.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/19/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q158ReadNCharsRead4II.h"

@interface Q158ReadNCharsRead4II()

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSArray *tempBuf;

@end

@implementation Q158ReadNCharsRead4II

//Difficulty: hard
//TAG: Google
//TAG: Facebook
//TAG: Data structure

/**
 * 158. Read N Characters Given Read4 II - Call multiple times
 * The API: int read4(char *buf) reads 4 characters at a time from a file.
 *
 * The return value is the actual number of characters read. For example, it returns 3 if there is only 3 characters left in the file.
 *
 * By using the read4 API, implement the function int read(char *buf, int n) that reads n characters from the file.
 *
 * Note:
 * The read function may be called multiple times.
 */

/*
 * Solution:
 * be aware that n may smaller than 4 or larger than 4, need diff operations
 * The key point to read char[] multiple times, is keep the visited index where current index at, after previous
 * read, so that when run next read, could have preserved index where to start
 */

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.index = 0;
        self.count = 0;
        self.tempBuf = [NSArray new];
    }
    return self;
}

- (NSInteger)read: (NSArray *)buf n: (NSInteger) n {
    NSMutableArray *mutBuf = [buf mutableCopy];
    NSInteger i = 0;
    while (i < n) {
        if (self.index == 0) self.count = [self read4:self.tempBuf];
        if (self.count == 0) break;
        while (i < n && self.index < self.count) {
            mutBuf[i++] = self.tempBuf[self.index++];
        }
        if (self.index >= self.count) self.index = 0;
    }
    return i;
}

- (NSInteger)read4: (NSArray *)buf { return 0; }

@end
