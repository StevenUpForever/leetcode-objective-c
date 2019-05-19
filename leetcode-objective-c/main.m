//
//  main.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Q76MinimumWindowSubstring.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Q76MinimumWindowSubstring *obj = [Q76MinimumWindowSubstring new];
        NSLog(@"%@", [obj minWindow:@"ADOBECODEBANC" t:@"ABC"]);
//        NSLog(@"%li", obj2.integerValue);
    }
    return 0;
}
