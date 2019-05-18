//
//  Q973KClosestPointsToOrigin.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q973KClosestPointsToOrigin.h"

@implementation Q973KClosestPointsToOrigin

//Difficulty: medium
//TAG: Facebook
//TAG: array
//TAG: sort

/**
 * 973. K Closest Points to Origin
 * We have a list of points on the plane.  Find the K closest points to the origin (0, 0).
 *
 * (Here, the distance between two points on a plane is the Euclidean distance.)
 *
 * You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)
 *
 *
 *
 * Example 1:
 *
 * Input: points = [[1,3],[-2,2]], K = 1
 * Output: [[-2,2]]
 * Explanation:
 * The distance between (1, 3) and the origin is sqrt(10).
 * The distance between (-2, 2) and the origin is sqrt(8).
 * Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
 * We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
 * Example 2:
 *
 * Input: points = [[3,3],[5,-1],[-2,4]], K = 2
 * Output: [[3,3],[-2,4]]
 * (The answer [[-2,4],[3,3]] would also be accepted.)
 *
 *
 * Note:
 *
 * 1 <= K <= points.length <= 10000
 * -10000 < points[i][0] < 10000
 * -10000 < points[i][1] < 10000
 */

/*
 Solution:
 
 Sort array then fetch first k elements
 
 Time: O(nlogn)
 Space: O(k)
 */

- (NSArray *)kClosest: (NSArray<NSArray<NSNumber *> *> *)points k: (NSInteger)k {
    points = [points sortedArrayUsingComparator:^NSComparisonResult(NSArray<NSNumber *> *  _Nonnull obj1, NSArray<NSNumber *> *  _Nonnull obj2) {
        return [self distance:obj1] - [self distance:obj2];
    }];
    return [points subarrayWithRange:NSMakeRange(0, MIN(k, points.count))];
}

- (NSInteger)distance: (NSArray<NSNumber *> *)point {
    return point[0].integerValue * point[0].integerValue + point[1].integerValue + point[1].integerValue;
}

@end
