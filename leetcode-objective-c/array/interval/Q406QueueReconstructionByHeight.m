//
//  Q406QueueReconstructionByHeight.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 4/9/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q406QueueReconstructionByHeight.h"

@implementation Q406QueueReconstructionByHeight

//TAG: Google
//TAG: array
//TAG: interval
//Difficulty: medium

/**
 * 406. Queue Reconstruction by Height
 * Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.
 
 Note:
 The number of people is less than 1,100.
 
 
 Example
 
 Input:
 [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]
 
 Output:
 [[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
 */

/*
 * Solution:
 * If the array need sort by multiple factors, like this need consider about h and k,
 * similar to time interval problems, fix one factor and consider about others
 *
 * In this problem we fix height factor due to it's easier to sort,
 * so select highest height arrays, sort by k
 * The select second highest height arrays, sort by k, this k is prior than before height k
 *
 * 1. Sort the array by height then by k,
 * 2. loop the arr, insert current people into people[1] place into a linkedList (Which is better in insert)
 * The reason is the lower height always have higher priority to insert by k
 *
 * Time: O(nlogn + n)
 * Space: O(n)
 */

- (NSArray<NSArray<NSNumber *> *> *)reconstructQueue: (NSArray<NSArray<NSNumber *> *> *)people {
    people = [people sortedArrayUsingComparator:^NSComparisonResult(NSArray<NSNumber *> *  _Nonnull obj1, NSArray<NSNumber *> *  _Nonnull obj2) {
        if ([obj1.firstObject isEqualToNumber:obj2.firstObject]) {
            return [obj1[1] compare:obj2[1]];
        } else return [obj1.firstObject compare:obj2.firstObject];
    }];
    //Arrange the object by smaller k first then smaller h
    NSMutableArray<NSArray<NSNumber *> *> *res = [NSMutableArray new];
    for (NSArray<NSNumber *> *arr in people) {
        [res insertObject:arr atIndex:arr.firstObject.integerValue];
    }
    return [res copy];
}

@end
