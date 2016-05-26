//
//  Search.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/26/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Search.h"

@implementation Search

- (NSInteger)binarySearch: (NSArray *)searchArray target: (NSNumber *)target {
    return [self binarySearchProcess:searchArray target:target startIndex:0 endIndex:searchArray.count - 1];
}

- (NSInteger)binarySearchProcess: (NSArray *)searchArray target: (NSNumber *)target startIndex: (NSInteger)start endIndex: (NSInteger)end {
    if (start > end) return -1;
    NSInteger middle = (start + end)/2;
    if (searchArray[middle] == target) return [searchArray indexOfObject:target];
    else if ([searchArray[middle] compare:target] == NSOrderedAscending) return [self binarySearchProcess:searchArray target:target startIndex:middle + 1 endIndex:end];
    else return [self binarySearchProcess:searchArray target:target startIndex:start endIndex:middle];
}

@end
