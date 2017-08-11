//
//  Median_Two_Sorted_Arrays.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/10/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Median_Two_Sorted_Arrays.h"

@implementation Median_Two_Sorted_Arrays

/**
 4. Median of Two Sorted Arrays
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 The median is 2.0
 
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 The median is (2 + 3)/2 = 2.5
 */

/**
 * Solution 1
 * Iterative each array, compare every element, merge two arrays to one array
 * need to consider about the total length of m + n is odd number or even number
 *
 * Time: O((m + n) m, n represent number of elements in each array
 * Space: O(m + n)
 */
- (double)findMedianSortedArraysS1: (NSArray *)nums1 andNums2: (NSArray *)nums2 {
    NSMutableArray *nums = [[NSMutableArray alloc]init];
    int i = 0, j = 0;
    while (i < nums1.count && j < nums2.count) {
        [nums addObject:[nums1[i] integerValue] < [nums2[j] integerValue] ? nums1[i++] : nums2[j++]];
    }
    //Remember the post steps when length of nums1 and nums2 is not same
    while (i < nums1.count) [nums addObject:nums1[i++]];
    while (j < nums2.count) [nums addObject:nums2[j++]];
    NSInteger len = nums.count;
    return nums.count % 2 == 0 ? ([nums[len/2-1] doubleValue] + [nums[len/2] doubleValue])/2 : [nums[len/2] doubleValue];
}

/**
 * Solution 2
 * Due to sorted array and find median, use binary search, recursion steps (also could implement in iterative way)
 * 1. for first step, assume the total length k
 *      1. When k/2 is over any of array's length (finally will ensure one array will over limit), return another array element which currentStart + currentK - 1, index is smaller 1 than length k
 *      2. assume k/2 will not over length of array 1 and array 2, then compare num1[k/2] and num2[k/2], pass all numbers in smaller k/2 part of the two arrays, because median is not possible in the smaller array k/2 part, as the worst case, array {1, 2, 6, 7, 8} and {3, 4, 5, 7, 8} although all elements in array 2 before k/2 is larger than array 1, but final result is 6, the k/2 in Max(array1[k/2], array2[k/2])
 * 2. recursion step, k = k/2, already ignore k/2 part, next step is find in smaller parts which in k/4 part
 *
 * Time: O(log(min(m, n)))
 * Space: Theoretically O(1), worst case O(log(min(m, n))
 *
 */
- (double)findMedianSortedArraysS2: (NSArray *)nums1 andNums2: (NSArray *)nums2 {
    /*
     Define two types of length
     if total length is odd number, +1 and +2 /2 are all the median index + 1
     if total length is even number, +1 and +2 /2 are left and right of median index + 1
     */
    NSInteger len1 = nums1.count + nums2.count + 1;
    NSInteger len2 = nums1.count + nums2.count + 2;
    return ([self findMedianSortedArraysHelper:nums1 i:0 nums2:nums2 j:0 k:len1/2] + [self findMedianSortedArraysHelper:nums1 i:0 nums2:nums2 j:0 k:len2/2])/2;
}

- (double)findMedianSortedArraysHelper: (NSArray *)nums1 i:(NSInteger)i nums2: (NSArray *)nums2 j: (NSInteger)j k: (NSInteger)k {
    //if i or j is over the array length, no need to compare k/2 part from each array any more, return the kth number in the other valid array
    if (i >= nums1.count) return [nums2[j + k - 1] doubleValue];
    if (j >= nums2.count) return [nums1[i + k - 1] doubleValue];
    //if i and j are all not over the length, len1 - len2 < 2, and k == 1 means no more k/2, time to decide which (nums1[i], nums2[j]) is the median,
    // due to need to skip the smaller k/2 part, and for now, the skipped number is the median, so small part of current comparison is the result, choose min(nums1[i], nums2[j])
    if (k == 1) return MIN([nums1[i] doubleValue], [nums2[j] doubleValue]);
    //Choose the current end of k/2 part number of each array, and compare, skip the smaller k/2 part in that array
    NSInteger nums1Mid = i + k/2 - 1 < nums1.count ? [nums1[i + k/2 - 1] integerValue] : INT_MAX;
    NSInteger nums2Mid = j + k/2 - 1 < nums2.count ? [nums2[j + k/2 - 1] integerValue] : INT_MAX;
    return nums1Mid < nums2Mid ?
    [self findMedianSortedArraysHelper:nums1 i:i + k/2 nums2:nums2 j:j k:k - k/2] :
    [self findMedianSortedArraysHelper:nums1 i:i nums2:nums2 j:j + k/2 k:k - k/2];
}



@end
