//
//  Problem151To160.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/24/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem151To160.h"

@implementation Problem151To160

/*
 151. Reverse Words in a String
 Given an input string, reverse the string word by word.
 
 For example,
 Given s = "the sky is blue",
 return "blue is sky the".
 
 Update (2015-02-12):
 For C programmers: Try to solve it in-place in O(1) space.
 */
- (NSString *)reverseWords: (NSString *)input {
    NSArray *strArray = [input componentsSeparatedByString:@" "];
    NSMutableString *result = [[NSMutableString alloc]init];
    for (NSInteger index = strArray.count - 1; index >= 0; index--) {
        [result appendString:strArray[index]];
        if (index != 0) {
            [result appendString:@" "];
        }
    }
    return result;
}


@end
