//
//  main.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/14/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Problem1To10.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Problem1To10 *problem1 = [[Problem1To10 alloc]init];
        NSLog(@"%@", [problem1 twoSum:@[@2, @7, @11, @15] target:9]);
    }
    return 0;
}
