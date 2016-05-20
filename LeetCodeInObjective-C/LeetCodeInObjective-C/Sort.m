//
//  Sort.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/14/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Sort.h"

@implementation Sort

/*
 Due to NSArray cannot be modified, so actually some sort algorithms in Objective-C should have space complexity at least O(n)
 */

/*
 Time complexity: O(n2)
 Space complexity: O(1)
 */

- (NSArray *)bubbleSort: (NSArray *)ary {
    NSMutableArray *mutableArray = [ary mutableCopy];
    for (int i = 0; i < mutableArray.count; i++) {
        for (int j = 0; j < mutableArray.count - i - 1; j++) {
            if ([mutableArray[j] integerValue] > [mutableArray[j + 1] integerValue]) {
                [mutableArray exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
    return [mutableArray copy];
}

/*
 */
- (NSArray *)selectionSort: (NSArray *)ary {
    NSMutableArray *mutableArray = [ary mutableCopy];
    for (int i = 0; i < mutableArray.count - 1; i++) {
        NSInteger minIndex = i;
        for (int j = i + 1; j < mutableArray.count; j++) {
            if ([mutableArray[j] integerValue] < [mutableArray[minIndex]integerValue]) {
                minIndex = j;
            }
        }
        [mutableArray exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
    }
    return [mutableArray copy];
}


@end
