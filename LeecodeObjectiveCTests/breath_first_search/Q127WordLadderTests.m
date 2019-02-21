//
//  Q127WordLadder.m
//  LeecodeObjectiveCTests
//
//  Created by Chengzhi Jia on 2/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Q127WordLadder.h"

@interface Q127WordLadderTests : XCTestCase

@property (nonatomic) Q127WordLadder *obj;

@end

@implementation Q127WordLadderTests

- (void)setUp {
    self.obj = [[Q127WordLadder alloc]init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testCase1 {
    NSInteger len = [self.obj ladderLength:@"hit" endWord:@"cog" wordList:@[@"hot",@"dot",@"dog",@"lot",@"log",@"cog"]];
    XCTAssertEqual(len, 5);
}

- (void)testCase2 {
    NSInteger len = [self.obj ladderLength:@"hit" endWord:@"cog" wordList:@[@"hot",@"dot",@"dog",@"lot",@"log"]];
    XCTAssertEqual(len, 0);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
