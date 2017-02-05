//
//  Problem281To290.m
//  LeetCodeInObjective-C
//
//  Created by Steven Jia on 8/4/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem281To290.h"

@implementation Problem281To290

/*
 283. Move Zeroes
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 
 Note:
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 */
/*
 1 slow pointer and 1 fast pointer go at the same direction, this will not change the original relative order, remember for loop from
 the first element not the second one, make sure slow pointer always point to the next of known non-zero element, in case when set all rest
 elements to 0 will also set the last known non-zero element
 2个隔板同向而行，快慢指针，不会改变原来数据的顺序，从第一位开始循环而不是第二位以保证慢指针一直在已知非0元素的下一位，在清零时不会清除已知最后一位非零元素
 for example: [1, 0]
 */
- (void)moveZeroes: (NSArray *)nums {
    if (nums == nil || nums.count < 2) {
        return;
    }
    int index = 0;
    NSMutableArray *mutableCopy = [[NSMutableArray alloc]initWithArray:nums];
    for (int i = 0; i < mutableCopy.count; i++) {
        if ([mutableCopy[i] integerValue] != 0) {
            mutableCopy[index++] = mutableCopy[i];
        }
    }
    for (int j = index; j < mutableCopy.count; j++) {
        mutableCopy[j] = [NSNumber numberWithInteger:0];
    }
    nums = mutableCopy;
}


@end

/*
 288. Unique Word Abbreviation
 An abbreviation of a word follows the form <first letter><number><last letter>. Below are some examples of word abbreviations:
 
 a) it                      --> it    (no abbreviation)
 
 1
 b) d|o|g                   --> d1g
 
 1    1  1
 1---5----0----5--8
 c) i|nternationalizatio|n  --> i18n
 
 1
 1---5----0
 d) l|ocalizatio|n          --> l10n
 Assume you have a dictionary and given a word, find whether its abbreviation is unique in the dictionary. A word's abbreviation is unique if no other word from the dictionary has the same abbreviation.
 
 Example:
 Given dictionary = [ "deer", "door", "cake", "card" ]
 
 isUnique("dear") -> false
 isUnique("cart") -> true
 isUnique("cane") -> false
 isUnique("make") -> true
 */

@interface ValidWordAbbr()

@property (nonatomic) NSMutableDictionary *dict;

@end

@implementation ValidWordAbbr

- (instancetype)initWithStrArray: (NSArray *)dictionary {
    self = [super init];
    if (self) {
        _dict = [[NSMutableDictionary alloc]init];
        for (NSString *str in dictionary) {
            NSString *key = [self convertString:str];
            if ([self.dict.allKeys containsObject:key] && [self.dict[key] isEqualToString:str]) {
                [self.dict setObject:@"" forKey:key];
            } else {
                [self.dict setObject:str forKey:key];
            }
        }
    }
    return self;
}

- (BOOL)isUnique: (NSString *)word {
    NSString *key = [self convertString:word];
    return !self.dict[key] || [self.dict[key] isEqualToString:word];
}

- (NSString *)convertString: (NSString *)str {
    if (str.length < 2) return str;
    return [NSString stringWithFormat:@"%c%li%c", [str characterAtIndex:0], str.length - 2, [str characterAtIndex:str.length - 1]];
}

@end

