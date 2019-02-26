//
//  main.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Q755PourWater.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Q755PourWater *obj = [[Q755PourWater alloc]init];
        NSLog(@"%@", [obj pourWater:@[@2,@1,@1,@2,@1,@2,@2] :4 :3]);
    }
    return 0;
}
