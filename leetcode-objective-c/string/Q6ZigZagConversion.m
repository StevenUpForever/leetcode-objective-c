//
//  ZigZag_Conversion.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/10/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Q6ZigZagConversion.h"

@implementation Q6ZigZagConversion

//Difficulty: Medium
//TAG: string

/**
 * 6. ZigZag Conversion
 * The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
 
 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"
 Write the code that will take a string and make this conversion given a number of rows:
 
 string convert(string text, int nRows);
 convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
 */

/*
 * Solution:
 * 1. Build nRows number of StringBuilders
 * 2. Iterative every character in string, with the loop for current nRows from left -> right -> left to add each character in proper StringBuilder
 *      Due to ensure the positive and opposite direction has the same length, positive length is [0...nRows - 2], opposite length is [nRows - 1, 1]
 * 3. concat every stringBuilder
 *
 * Time: O(n) for loop each character once
 * Space: O(n) no matter how many stringBuilders created, total characters in all builders are n
 */

- (NSString *)convert: (NSString *)s numRows: (NSInteger)numRows {
    if (s.length == 0 || numRows < 2) return s;
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:numRows];
    for (int i = 0; i < arr.count; i++) arr[i] = [[NSMutableString alloc]init];
    int i = 0;
    while (i < s.length) {
        for (NSInteger m = 0; i < s.length && m < arr.count - 1; m++) {
            [arr[m] appendFormat:@"%c", [s characterAtIndex:m]];
            i++;
        }
        for (NSInteger n = arr.count - 1; i < s.length && n > 0; n--) {
            [arr[n] appendFormat:@"%c", [s characterAtIndex:n]];
            i++;
        }
    }
    for (int i = 1; i < arr.count; i++) [arr[0] appendString:arr[i]];
    return [arr[0] copy];
    }

@end
