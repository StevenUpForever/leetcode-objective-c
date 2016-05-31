//
//  main.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/14/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Problem1To10.h"
#import "Problem41To50.h"
#import "Problem151To160.h"
#import "Sort.h"
#import "Search.h"
#import "OtherAlogrithms.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Problem1To10 *problem1 = [[Problem1To10 alloc]init];
//        NSLog(@"%@", [problem1 twoSum:@[@2, @7, @11, @15] target:9]);
//        NSLog(@"%f", [problem1 findMedianSortedArrays:@[@1, @3, @5] andNum2:@[@2, @4, @9]]);
//        NSLog(@"%ld", (long)[problem1 lengthOfLongestSubstring:@"wke"]);
//        NSLog(@"%@", [problem1 longestPalindrome:@"aaaaaaaaaaaaaaaaaabcaaaaaaaaaaaaaaaaa"]);
//        NSLog(@"%li", [problem1 myAtoi:@"9223372036854775809"]);
//        
//        Problem151To160 *problem150 = [[Problem151To160 alloc]init];
//        NSLog(@"%@", [problem150 reverseWords:@"the sky is blue"]);
//        
//        Sort *sort = [[Sort alloc]init];
//        NSArray *sortArray = @[@13, @19, @9, @5, @12, @8, @7, @4, @21, @2, @6, @11];
//        NSLog(@"Bubble sort: %@", [sort bubbleSort:sortArray]);
//        NSLog(@"Quick sort 1: %@", [sort quickSortOne:sortArray]);
//        NSLog(@"Quick sort 2: %@", [sort quickSortTwo:sortArray]);
//        NSLog(@"Selection sort: %@", [sort selectionSort:sortArray]);
//        NSLog(@"Heap sort: %@", [sort heapSort:sortArray]);
//        NSLog(@"Insertion sort: %@", [sort insertionSort:sortArray]);
//         NSLog(@"Shell sort: %@", [sort shellSort:sortArray]);
//        NSLog(@"Merge sort: %@", [sort mergeSort:sortArray]);
//        
//        OtherAlogrithms *other = [[OtherAlogrithms alloc]init];
//        NSLog(@"%@", [other wholeStringArrangementWithoutRepeat:@"abc"]);
//        NSLog(@"%@", [other wholeStringArrangementWithRepeat:@"abb"]);
//        
//        Search *search = [[Search alloc]init];
//        NSLog(@"%li", [search binarySearch:@[@1, @3, @5, @7, @9, @11] target:@3]);
        Problem41To50 *problem41To50 = [[Problem41To50 alloc]init];
        NSLog(@"%@", [problem41To50 groupAnagrams:@[@"eat", @"tea", @"tan", @"ate", @"nat", @"bat"]]);
        
                
    }
    return 0;
}