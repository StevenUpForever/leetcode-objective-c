//
//  main.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/14/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Problem1To10.h"
#import "Sort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Problem1To10 *problem1 = [[Problem1To10 alloc]init];
        NSLog(@"%@", [problem1 twoSum:@[@2, @7, @11, @15] target:9]);
        NSLog(@"%f", [problem1 findMedianSortedArrays:@[@1, @3, @5] andNum2:@[@2, @4, @9]]);
        NSLog(@"%ld", (long)[problem1 lengthOfLongestSubstring:@"wke"]);
        NSLog(@"%@", [problem1 longestPalindrome:@"aaaaaaaaaaaaaaaaaabcaaaaaaaaaaaaaaaaa"]);
        NSLog(@"%li", [problem1 myAtoi:@"    -13   45asda23232ads1"]);
        
        Sort *sort = [[Sort alloc]init];
        NSArray *sortArray = @[@1, @3, @6, @2, @5, @4, @9, @7, @8, @0];
        NSLog(@"%@", [sort bubbleSort:sortArray]);
        NSLog(@"%@", [sort selectionSort:sortArray]);
    }
    return 0;
}
