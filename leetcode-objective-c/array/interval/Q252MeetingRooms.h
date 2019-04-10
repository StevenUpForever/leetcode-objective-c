//
//  Q252MeetingRooms.h
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 4/9/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Interval;
@interface Q252MeetingRooms : NSObject

- (BOOL)canAttendMeetings: (NSArray<Interval *> *)intervals;

@end

NS_ASSUME_NONNULL_END
