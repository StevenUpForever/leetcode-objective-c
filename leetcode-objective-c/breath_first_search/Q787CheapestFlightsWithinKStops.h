//
//  Q787CheapestFlightsWithinKStops.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/27/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Q787CheapestFlightsWithinKStops : NSObject

- (NSInteger)findCheapestPrice: (NSInteger)n : (NSArray<NSArray<NSNumber *> *> *)flights : (NSInteger)src : (NSInteger)dst : (NSInteger)K;

@end

@interface FlightInfo: NSObject

@property (nonatomic, assign) NSNumber *dst;
@property (nonatomic, assign) NSNumber *price;

- (instancetype)initWith: (NSNumber *)dst : (NSNumber *)price;

@end

NS_ASSUME_NONNULL_END
