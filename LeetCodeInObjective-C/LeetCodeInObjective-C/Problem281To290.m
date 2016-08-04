//
//  Problem281To290.m
//  LeetCodeInObjective-C
//
//  Created by Steven Jia on 8/4/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem281To290.h"

@implementation Problem281To290



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

