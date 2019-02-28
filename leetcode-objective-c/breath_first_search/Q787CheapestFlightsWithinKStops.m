//
//  Q787CheapestFlightsWithinKStops.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/27/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q787CheapestFlightsWithinKStops.h"

@implementation Q787CheapestFlightsWithinKStops

//Difficulty: Medium
//TAG: Airbnb
//TAG: breadth first search
//TAG: Best first search

/**
 * 787. Cheapest Flights Within K Stops
 * There are n cities connected by m flights. Each fight starts from city u and arrives at v with a price w.
 *
 * Now given all the cities and flights, together with starting city src and the destination dst, your task is to find the cheapest price from src to dst with up to k stops. If there is no such route, output -1.
 *
 * Example 1:
 * Input:
 * n = 3, edges = [[0,1,100],[1,2,100],[0,2,500]]
 * src = 0, dst = 2, k = 1
 * Output: 200
 * Explanation:
 * The graph looks like this:
 *
 *
 * The cheapest price from city 0 to city 2 with at most 1 stop costs 200, as marked red in the picture.
 * Example 2:
 * Input:
 * n = 3, edges = [[0,1,100],[1,2,100],[0,2,500]]
 * src = 0, dst = 2, k = 0
 * Output: 500
 * Explanation:
 * The graph looks like this:
 *
 *
 * The cheapest price from city 0 to city 2 with at most 0 stop costs 500, as marked blue in the picture.
 * Note:
 *
 * The number of nodes n will be in range [1, 100], with nodes labeled from 0 to n - 1.
 * The size of flights will be in range [0, n * (n - 1) / 2].
 * The format of each flight will be (src, dst, price).
 * The price of each flight will be in the range [1, 10000].
 * k is in the range of [0, n - 1].
 * There will not be any duplicated flights or self cycles.
 */

/*
 Solution 1:
 Breath first search
 */

- (NSInteger)findCheapestPrice: (NSInteger)n : (NSArray<NSArray<NSNumber *> *> *)flights : (NSInteger)src : (NSInteger)dst : (NSInteger)K {
    //K是中转站，所以当K==0时，只要第一站有dst即可
    if (!flights || K < 0) return -1;
    NSMutableArray<FlightInfo *> *queue = [NSMutableArray new];
    NSMutableDictionary<NSNumber *, NSMutableArray<FlightInfo *> *> *dict = [NSMutableDictionary new];
    for (NSArray<NSNumber *> *arr in flights) {
        if (arr.count > 3) continue;
        if (!dict[arr[0]]) dict[arr[0]] = [NSMutableArray new];
        FlightInfo *newInfo = [[FlightInfo alloc]initWith: arr[1] : arr[2]];
        [dict[arr[0]] addObject: newInfo];
        //实际上queue初始化加的是第一个stop的信息
        if ([arr[0] integerValue] == src) [queue addObject: newInfo];
    }
    
    NSInteger min = NSIntegerMax;
    while (queue.count > 0 && K-- >= 0) {
        NSInteger size = queue.count;
        while (size-- > 0) {
            //更新min by poll，因为初始化的第一站还没有检查
            FlightInfo *poll = queue.firstObject;
            [queue removeObjectAtIndex: 0];
            if ([poll.dst integerValue] == dst) {
                min = MIN(min, [poll.price integerValue]);
            }
            NSMutableArray<FlightInfo *> *arr = dict[poll.dst];
            if (!arr) continue;
            for (FlightInfo *info in arr) {
                //在这里优化，当前path不可能小于min时，不用加入queue
                NSInteger newPrice = [poll.price integerValue] + [info.price integerValue];
                if (newPrice <= min) {
                    FlightInfo *newInfo = [[FlightInfo alloc]initWith: info.dst :
                                           @([poll.price integerValue] + [info.price integerValue])];
                    [queue addObject: newInfo];
                }
            }
        }
    }
    return min == NSIntegerMax ? -1 : min;
}


@end

@implementation FlightInfo

- (instancetype)initWith: (NSNumber *)dst : (NSNumber *)price {
    self = [super init];
    if (self) {
        _dst = dst;
        _price = price;
    }
    return self;
}

@end
