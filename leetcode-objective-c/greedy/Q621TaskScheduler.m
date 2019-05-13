//
//  Q621TaskScheduler.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/12/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q621TaskScheduler.h"

@implementation Q621TaskScheduler

//TAG: Facebook
//TAG: Greedy
//Difficulty: Medium

/**
 * 621. Task Scheduler
 * Given a char array representing tasks CPU need to do. It contains capital letters A to Z where different letters represent different tasks.Tasks could be done without original order. Each task could be done in one interval. For each interval, CPU could finish one task or just be idle.
 
 However, there is a non-negative cooling interval n that means between two same tasks, there must be at least n intervals that CPU are doing different tasks or just be idle.
 
 You need to return the least number of intervals the CPU will take to finish all the given tasks.
 
 Example 1:
 Input: tasks = ["A","A","A","B","B","B"], n = 2
 Output: 8
 Explanation: A -> B -> idle -> A -> B -> idle -> A -> B.
 Note:
 The number of tasks is in the range [1, 10000].
 The integer n is in the range [0, 100].
 */

/*
 * Solution 1:
 * https://leetcode.com/problems/task-scheduler/discuss/104496/concise-Java-Solution-O(N)-time-O(26)-space
 */

- (NSInteger)leastINterval: (NSArray<NSString *> *)tasks : (NSInteger)n {
    NSMutableArray<NSNumber *> *arr = [NSMutableArray new];
    for (NSInteger i = 0; i < 26; i++) [arr addObject:@0];
    for (NSString *str in tasks) {
        arr[str.integerValue] = @(arr[str.integerValue].integerValue + 1);
    }
    [arr sortUsingComparator:^NSComparisonResult(NSNumber *  _Nonnull obj1, NSNumber *  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    NSInteger index = 25;
    while (index >= 0 && [arr[index] isEqualToNumber:arr[25]]) {
        index--;
    }
    return MAX(tasks.count, (arr[25].integerValue - 1) * (n - 1) + 25 - index);
}

@end
