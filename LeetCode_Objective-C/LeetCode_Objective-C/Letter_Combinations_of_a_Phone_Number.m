//
//  Letter_Combinations_of_a_Phone_Number.m
//  LeetCode_Objective-C
//
//  Created by Chengzhi Jia on 8/16/17.
//  Copyright © 2017 Chengzhi Jia. All rights reserved.
//

#import "Letter_Combinations_of_a_Phone_Number.h"

@interface Letter_Combinations_of_a_Phone_Number()

@property (nonatomic, copy) NSArray *digitPad;

@end

@implementation Letter_Combinations_of_a_Phone_Number

/**
 * 17. Letter Combinations of a Phone Number
 * Given a digit string, return all possible letter combinations that the number could represent.
 
 A mapping of digit to letters (just like on the telephone buttons) is given below.
 
 
 
 Input:Digit string "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 Note:
 Although the above answer is in lexicographical order, your answer could be in any order you want.
 */

/**
 * Solution 1 (Iterative):
 * Outer loop is all characters in string digits, for each character in digits
 *      remove the current first string temp in result list, for the mapped string in digit pad of current character, append it to this temp and add it into final list
 *
 * Time: O(3^n) n represent the length of digits
 * Space: O(3^n) All strings in result list
 */

- (instancetype)init
{
    self = [super init];
    if (self) {
        _digitPad = @[@"0", @"1", @"abc", @"def", @"ghi", @"jkl", @"mno", @"pqrs", @"tuv", @"wxyz"];
    }
    return self;
}

- (NSArray *)letterCombinationsS1: (NSString *)digits {
    NSMutableArray *res = [[NSMutableArray alloc]init];
    if (digits.length == 0) return [res copy];
    [res addObject:@""];
    for (int i = 0; i < digits.length; i++) {
        NSInteger padIndex = [digits characterAtIndex:i] - '0';
        //While loop all strings not append current character, like when after the third outer loop, the length in result array is [2, 2, 2, 3, 3, 3], need first 3 strings
        while ([res.firstObject length] == i) {
            NSString *cur = res.firstObject;
            [res removeObjectAtIndex:0];
            NSString *digitStr = self.digitPad[padIndex];
            for (int j = 0; j < digitStr.length; j++) {
                [res addObject:[NSString stringWithFormat:@"%@%c", cur, [digitStr characterAtIndex:j]]];
            }
        }
    }
    return [res copy];
}

/**
 * Solution 2 (recursion):
 * Base case: when current string is longer or equal to digits
 *      1.  at least length of result string is 2 like 2, 3 to ad, which when pivot + 1 == 3 equal to string length (each string in pad in length 3)
 *      2. when digits is longer than 2, result will longer than 2 either, which result string length > digit length
 * Recursion rule:
 *      1. iterative all characters in digit pad string, add new character in this string to a current recursion string
 *      2. bring this current appended string to next recursion step
 *
 * Time: O(3^n) n represent the length of digits
 * Space: O(3^n) All strings in result list
 */
- (NSArray *)letterCombinationsS2: (NSString *)digits {
    NSMutableArray *res = [[NSMutableArray alloc]init];
    if (digits.length == 0) return [res copy];
    [res addObject:@""];
    for (int i = 0; i < digits.length; i++) {
        NSInteger padIndex = [digits characterAtIndex:i] - '0';
        //While loop all strings not append current character, like when after the third outer loop, the length in result array is [2, 2, 2, 3, 3, 3], need first 3 strings
        while ([res.firstObject length] == i) {
            NSString *cur = res.firstObject;
            [res removeObjectAtIndex:0];
            NSString *digitStr = self.digitPad[padIndex];
            for (int j = 0; j < digitStr.length; j++) {
                [res addObject:[NSString stringWithFormat:@"%@%c", cur, [digitStr characterAtIndex:j]]];
            }
        }
    }
    return [res copy];
}

- (void)letterCombinationsHelper: (NSMutableString *)str res: (NSMutableArray *)res digits: (NSString *)digits index: (NSInteger)index {
    if (index >= digits.length) {
        [res addObject:[str copy]];
        return;
    }
    NSString *curDigit = self.digitPad[[digits characterAtIndex:index] - '0'];
    for (NSInteger i = 0; i < curDigit.length; i++) {
        [str appendFormat:@"%c", [curDigit characterAtIndex:i]];
        [self letterCombinationsHelper:str res:res digits:digits index:index+1];
        [str deleteCharactersInRange:NSMakeRange(str.length - 1, 1)];
    }
}

@end
