//
//  main.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Q282ExpressionAddOperators.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Q282ExpressionAddOperators *obj = [Q282ExpressionAddOperators new];
        NSLog(@"%@", [obj addOperators:@"00" target:0]);
    }
    return 0;
}
