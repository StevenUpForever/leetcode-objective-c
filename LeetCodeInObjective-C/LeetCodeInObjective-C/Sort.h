//
//  Sort.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/14/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sort : NSObject

/**********Exchange sort**********/
- (NSArray *)bubbleSort: (NSArray *)ary;
- (NSArray *)quickSortOne: (NSArray *)ary;
- (NSArray *)quickSortTwo:(NSArray *)ary;

/**********Selection sort**********/
- (NSArray *)selectionSort: (NSArray *)ary;
- (NSArray *)heapSort: (NSArray *)input;

/**********Insertion sort**********/
- (NSArray *)insertionSort: (NSArray *)ary;
- (NSArray *)shellSort: (NSArray *)input;

/**********Merge sort**********/
- (NSArray *)mergeSort: (NSArray *)input;

@end
