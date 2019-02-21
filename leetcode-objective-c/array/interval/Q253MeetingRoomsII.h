//
//  Q253MeetingRoomsII.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 2/20/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Interval;
@interface Q253MeetingRoomsII : NSObject

- (NSInteger)minMeetingRooms: (NSArray<Interval *> *)intervals;

@end

NS_ASSUME_NONNULL_END
