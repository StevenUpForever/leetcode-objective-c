//
//  Q146LRUCacheTests.m
//  leetcode-objective-c-tests
//
//  Created by Chengzhi Jia on 2/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Q146LRUCache.h"

@interface Q146LRUCacheTests : XCTestCase

@end

@implementation Q146LRUCacheTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testCase1 {
    Q146LRUCache *obj = [[Q146LRUCache alloc]initWithCapacity:2];
    [obj put:1 value:1];
    [obj put:2 value:2];
    XCTAssertEqual([obj get:1], 1);
    [obj put:3 value:3];
    XCTAssertEqual([obj get:2], -1);
    [obj put:4 value:4];
    XCTAssertEqual([obj get:1], -1);
    XCTAssertEqual([obj get:3], 3);
    XCTAssertEqual([obj get:4], 4);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
