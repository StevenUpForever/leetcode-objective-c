//
//  Sort.h
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/14/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sort : NSObject

- (NSArray *)bubbleSort: (NSArray *)ary;
- (NSArray *)selectionSort: (NSArray *)ary;
- (NSArray *)insertionSort: (NSArray *)ary;
- (NSArray *)quickSortOne: (NSArray *)ary;
- (NSArray *)quickSortTwo:(NSArray *)ary;
- (NSArray *)mergeSort: (NSArray *)input;
- (NSArray *)shellSort: (NSArray *)input;

@end
