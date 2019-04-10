//
//  Q616AddBoldTagInString.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 4/9/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q616AddBoldTagInString.h"

@implementation Q616AddBoldTagInString

//TAG: Google
//TAG: merge intervals
//Difficulty: medium

/**
 * 616. Add Bold Tag in String
 * Given a string s and a list of strings dict, you need to add a closed pair of bold tag <b> and </b> to wrap the substrings in s that exist in dict. If two such substrings overlap, you need to wrap them together by only one pair of closed bold tag. Also, if two substrings wrapped by bold tags are consecutive, you need to combine them.
 * Example 1:
 * Input:
 * s = "abcxyz123"
 * dict = ["abc","123"]
 * Output:
 * "<b>abc</b>xyz<b>123</b>"
 * Example 2:
 * Input:
 * s = "aaabbcc"
 * dict = ["aaa","aab","bc"]
 * Output:
 * "<b>aaabbc</b>c"
 * Note:
 * The given dict won't contain duplicates, and its length won't exceed 100.
 * All the strings in input have length in range [1, 1000].
 */

/*
Solution:
1. prepare a boolean array that represent if current index will be finally add a <b>
2. loop string i
    1. loop from j = i, j >= 0 j--
    2. if the substring(j, i) is in the set, try to update start and end with curStart, curEnd if curStart <= end
    3. if curStart > end, add <b> to start, end and repeat step 2
3. finally add <b> to start, end due to last pair may not added <b>
*/

- (NSString *)addBoldTag: (NSString *)s dict: (NSArray<NSString *> *)dict {
    NSMutableArray<NSNumber *> *bold = [NSMutableArray new];
    for (NSInteger i = 0, temp = 0; i < s.length; i++) {
        for (NSString * word in dict) {
            if ([[s substringFromIndex:i] hasPrefix:word]) {
                //i + word.length for last valid char fit end > i
                temp = MAX(temp, i + word.length);
            }
        }
        [bold addObject:@(temp > i)];
    }
    NSMutableString *res = [NSMutableString new];
    for (NSInteger i = 0; i < s.length; i++) {
        if (bold[i].boolValue) {
            NSInteger j = i;
            while (j < s.length && bold[j].boolValue) {
                j++;
            }
            [res appendString:@"<b>"];
            [res appendString:[s substringWithRange:NSMakeRange(i, j - i)]];
            [res appendString:@"</b>"];
            i = j - 1;
        }
    }
    return [res copy];
}

@end
