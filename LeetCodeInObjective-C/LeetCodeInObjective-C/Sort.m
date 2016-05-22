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
 Time complexity: O(n) - O(n2)
 Space complexity: O(1)
 stable
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
 Time complexity: O(n2)
 Space complexity: O(1)
 unstable
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

/*
 Time complexity: O(n) - O(n2)
 Space comlexity: O(1)
 stable
 */
- (NSArray *)insertionSort: (NSArray *)ary {
    NSMutableArray *mutableArray = [ary mutableCopy];
    for (int i = 1; i < ary.count; i++) {
        NSNumber *temp = mutableArray[i];
        NSInteger index = i;
        for (int j = i - 1; j >= 0; j--) {
            if (mutableArray[j] > temp) {
                mutableArray[j + 1] = mutableArray[j];
                index = j;
            }
        }
        mutableArray[index] = temp;
    }
    return [mutableArray copy];
}

/*
 Time complexity: O(nlogn) - O(n2)
 Space complexity: O(logn) - O(n)
 unstable
 */

/**********Solution 1**********/

- (NSArray *)quickSortOne: (NSArray *)ary {
    if (ary.count <= 1) return ary;
    NSMutableArray *smallArray = [[NSMutableArray alloc]init];
    NSMutableArray *bigArray = [[NSMutableArray alloc]init];
    int pivot = arc4random()%ary.count;
    NSNumber *pivotNum = ary[pivot];
    for (NSNumber *num in ary) {
        if ([pivotNum integerValue] > [num integerValue]) {
            [smallArray addObject:num];
        } else {
            [bigArray addObject:num];
        }
    }
    NSMutableArray *result = [[NSMutableArray alloc]init];
    [result addObjectsFromArray:[self quickSortOne:smallArray]];
    [result addObjectsFromArray:[self quickSortOne:bigArray]];
    return result;
}

/**********Solution 2**********/

- (NSArray *)quickSortTwo:(NSArray *)ary {
    NSMutableArray *mutableArray = [ary mutableCopy];
    [self quickSortProcess:mutableArray startIndex:0 endIndex:mutableArray.count - 1];
    return [mutableArray copy];
}

- (void)quickSortProcess: (NSMutableArray *)input startIndex: (NSInteger)start endIndex: (NSInteger)end {
    if (start < end) {
        NSInteger pivot = [self partition:input startIndex:start endIndex:end];
        [self quickSortProcess:input startIndex:start endIndex:pivot - 1];
        [self quickSortProcess:input startIndex:pivot + 1 endIndex:end];
    }
}

- (NSInteger)partition: (NSMutableArray *)inputArray startIndex: (NSInteger)start endIndex: (NSInteger)end {
    NSNumber *pivot = inputArray[end];
    NSInteger startIndex = start;
    for (NSInteger index = start; index < end; index++) {
        if ([inputArray[index] integerValue] < [pivot integerValue]) {
            [inputArray exchangeObjectAtIndex:index withObjectAtIndex:startIndex];
            startIndex++;
        }
    }
    [inputArray exchangeObjectAtIndex:end withObjectAtIndex:startIndex];
    return startIndex;
}



@end
