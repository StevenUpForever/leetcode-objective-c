//
//  main.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Q127WordLadder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Q127WordLadder *obj = [[Q127WordLadder alloc]init];
        NSLog(@"%li", [obj ladderLength:@"hit" endWord:@"cog" wordList:@[@"hot",@"dot",@"dog",@"lot",@"log",@"cog"]]);
    }
    return 0;
}
