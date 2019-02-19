//
//  Q528RandomPickWithWeight.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q528RandomPickWithWeight.h"

@interface Q528RandomPickWithWeight()

@property (nonatomic) NSMutableArray<NSNumber *> *mutableArr;

@end

@implementation Q528RandomPickWithWeight

//Difficulty: medium
//TAG: Uber
//TAG: math
//TAG: random

/**
 * 528. Random Pick with Weight
 * Given an array w of positive integers, where w[i] describes the weight of index i, write a function pickIndex which randomly picks an index in proportion to its weight.
 *
 * Note:
 *
 * 1 <= w.length <= 10000
 * 1 <= w[i] <= 10^5
 * pickIndex will be called at most 10000 times.
 * Example 1:
 *
 * Input:
 * ["Solution","pickIndex"]
 * [[[1]],[]]
 * Output: [null,0]
 * Example 2:
 *
 * Input:
 * ["Solution","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex"]
 * [[[1,3]],[],[],[],[],[]]
 * Output: [null,0,1,1,1,0]
 * Explanation of Input Syntax:
 *
 * The input is two lists: the subroutines called and their arguments. Solution's constructor has one argument, the array w. pickIndex has no arguments. Arguments are always wrapped with a list, even if there aren't any.
 */

/*
 Solution:
 
 random pick happened by weight which means if random number between two adjacent weight, then pick the new index,
 e.g.:
 [2, 4] which means when random between 1-2 pick index 0, when between 3-(4 + 2) pick index 1
 
 use presum array add weights so that could quickly do a binary search in weights presum array
 
 */

- (instancetype)init: (NSArray<NSNumber *> *)w
{
    self = [super init];
    if (self) {
        _mutableArr = [NSMutableArray new];
        for (NSNumber * num in w) {
            [_mutableArr addObject:_mutableArr.count == 0 ? num :
             @(_mutableArr.lastObject.integerValue + num.integerValue)];
        }
    }
    return self;
}

- (NSInteger)pickIndex {
    int random = arc4random_uniform((int)self.mutableArr.count);
    
    NSInteger l = 0, r = self.mutableArr.count;
    while (l < r) {
        NSInteger mid = l + (r - l)/2;
        if (self.mutableArr[mid].integerValue == random) {
            return mid;
        } else if (self.mutableArr[mid].integerValue < random) {
            l = mid + 1;
        } else r = mid;
    }
    return l;
}

@end
