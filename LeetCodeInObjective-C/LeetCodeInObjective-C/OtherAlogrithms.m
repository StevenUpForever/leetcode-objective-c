//
//  OtherAlogrithms.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/25/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "OtherAlogrithms.h"

@implementation OtherAlogrithms

- (NSArray *)wholeStringArrangementWithoutRepeat: (NSString *)str {
    NSMutableArray *result = [[NSMutableArray alloc]init];
    [self allArrangement:result str:[str mutableCopy] current:0 total:str.length - 1];
    return result;
}

- (void)allArrangement: (NSMutableArray *)result str: (NSMutableString *)str current: (NSInteger)current total: (NSInteger)total {
    
    if (current == total) {
        [result addObject:[str copy]];
    }
    else {
        for (NSInteger i = current; i <= total; i++) {
            char temp = [str characterAtIndex:i];
            char currentChar = [str characterAtIndex:current];
            [str replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%c", currentChar]];
            [str replaceCharactersInRange:NSMakeRange(current, 1) withString:[NSString stringWithFormat:@"%c", temp]];
            [self allArrangement:result str:str current:current + 1 total:total];
            char temp2 = [str characterAtIndex:i];
            char currentChar2 = [str characterAtIndex:current];
            [str replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%c", currentChar2]];
            [str replaceCharactersInRange:NSMakeRange(current, 1) withString:[NSString stringWithFormat:@"%c", temp2]];
        }
    }
}

@end
