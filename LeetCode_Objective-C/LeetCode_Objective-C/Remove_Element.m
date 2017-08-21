//
//  Remove_Element.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/20/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Remove_Element.h"

@implementation Remove_Element

/**
 * 27. Remove Element
 * Given an array and a value, remove all instances of that value in place and return the new length.
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 The order of elements can be changed. It doesn't matter what you leave beyond the new length.
 
 Example:
 Given input array nums = [3,2,2,3], val = 3
 
 Your function should return length = 2, with the first two elements of nums being 2.
 */

/**
 * solution:
 * Similar as 'move 0s to the end' problem, use slow pointer and fast pointer,fast move forward by 1 every time, slow moves only when fast is not the val, slow represent all numbers not equal to val (NOT include slow)
 *      ****** Why NOT include slow, because we always know about val, slow just need to occupy the place going to replace with non-val, so not include slow (Different with remove dup but leave one problem) ******
 * ignore set all rest of value to val of right of slow as move 0s problem
 */
- (NSInteger)removeElement: (NSArray *)nums val: (NSNumber *)val {
    NSInteger slow = 0;
    NSMutableArray *mutNums = [nums mutableCopy];
    for (NSInteger fast = 0; fast < mutNums.count; fast++) {
        if (mutNums[fast] != mutNums[slow]) mutNums[slow++] = mutNums[fast];
    }
    return slow;
}

@end
