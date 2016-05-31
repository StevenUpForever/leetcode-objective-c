//
//  Problem41To50.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/30/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem41To50.h"

@implementation Problem41To50

/*
 49. Group Anagrams
 Given an array of strings, group anagrams together.
 
 For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Return:
 
 [
 ["ate", "eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 Note:
 For the return value, each inner list's elements must follow the lexicographic order.
 All inputs will be in lower-case.
 */
- (NSArray<NSArray<NSString *> *> *)groupAnagrams: (NSArray<NSString *> *)strs {
    if (strs.count == 0) return nil;
    strs = [strs sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *dict = [[NSMutableDictionary alloc]init];
    for (NSString *str in strs) {
        unichar *buffer = (unichar *)malloc(sizeof(unichar) * str.length);
        [str getCharacters:buffer];
        qsort_b(buffer, str.length, sizeof(unichar), ^int(const void *a, const void *b) {
            unichar m = *(unichar *)a;
            unichar n = *(unichar *)b;
            return m - n;
        });
        NSString *keyStr = [NSString stringWithCharacters:buffer length:str.length];
        free(buffer);
        if ([dict.allKeys containsObject:keyStr]) {
            [dict[keyStr] addObject:str];
        } else {
            [dict setObject:[NSMutableArray arrayWithObjects:str, nil] forKey:keyStr];
        }
    }
    return dict.allValues;
}

@end
