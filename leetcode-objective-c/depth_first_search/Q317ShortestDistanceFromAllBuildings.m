//
//  Q317ShortestDistanceFromAllBuildings.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/18/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q317ShortestDistanceFromAllBuildings.h"

@implementation Q317ShortestDistanceFromAllBuildings

//Difficulty: hard
//TAG: Facebook
//TAG: BFS

/**
 * 317. Shortest Distance from All Buildings
 * You want to build a house on an empty land which reaches all buildings in the shortest amount of distance. You can only move up, down, left and right. You are given a 2D grid of values 0, 1 or 2, where:
 *
 * Each 0 marks an empty land which you can pass by freely.
 * Each 1 marks a building which you cannot pass through.
 * Each 2 marks an obstacle which you cannot pass through.
 * Example:
 *
 * Input: [[1,0,2,0,1],[0,0,0,0,0],[0,0,1,0,0]]
 *
 * 1 - 0 - 2 - 0 - 1
 * |   |   |   |   |
 * 0 - 0 - 0 - 0 - 0
 * |   |   |   |   |
 * 0 - 0 - 1 - 0 - 0
 *
 * Output: 7
 *
 * Explanation: Given three buildings at (0,0), (0,4), (2,2), and an obstacle at (0,2),
 *              the point (1,2) is an ideal empty land to build a house, as the total
 *              travel distance of 3+3+1=7 is minimal. So return 7.
 * Note:
 * There will be at least one building. If it is not possible to build such house according to the above rules, return -1.
 */

/*
 Solution:
 
 BFS
 1. loop the grid, count all building (1), and set 0 to 3, in order to separate steps count with 1 or 2
 2. loop the grid, do bfs and add steps to current grid when it's >= 3,
 count how many buildings can reach to current cell
 3. count the grid, min = min(min, totalSteps[i][j]) only if steps >= 3 and buildings here can reach == count
 
 Time: O(2mn + mn * buildings) = O(buildings * mn)
 Space: O(mn) for visited and map
 
 Improvement:
 
 1. merge first loop to second, can bfs and do set to 3 && count++ at the same time
 2. when bfs and find current steps > max, then don't need bfs from here any more
 */

- (NSInteger)shortestDistance: (NSArray<NSArray<NSNumber *> *> *)grid {
    NSMutableArray<NSMutableArray<NSNumber *> *> *mut = [NSMutableArray new];
    for (NSArray<NSNumber *> *detail in grid) [mut addObject:[detail mutableCopy]];
    NSInteger count = 0;
    for (NSInteger i = 0; i < mut.count; i++) {
        for (NSInteger j = 0; j < mut[i].count; j++) {
            if ([mut[i][j] isEqualToNumber:@1]) count++;
            else if ([mut[i][j] isEqualToNumber:@0]) mut[i][j] = @3;
        }
    }
    NSMutableDictionary<NSString *, NSNumber *> *dict = [NSMutableDictionary new];
    for (NSInteger i = 0; i < mut.count; i++) {
        for (NSInteger j = 0; j < mut[i].count; j++) {
            if ([mut[i][j] isEqualToNumber:@1]) [self bfs:mut i:i j:j dict:dict];
        }
    }
    NSInteger min = NSIntegerMax;
    for (NSInteger i = 0; i < mut.count; i++) {
        for (NSInteger j = 0; j < mut[i].count; j++) {
            if (mut[i][j].integerValue >= 3 &&
                dict[[NSString stringWithFormat:@"%li,%li", i, j]].integerValue == count)
                min = MIN(min, mut[i][j].integerValue);
        }
    }
    return min == NSIntegerMax ? -1 : min - 3;
}

- (void)bfs: (NSMutableArray<NSMutableArray<NSNumber *> *> *)grid i: (NSInteger)i j: (NSInteger)j dict: (NSMutableDictionary<NSString *, NSNumber *> *)dict {
    NSArray<NSArray<NSNumber *> *> *dirs = @[@[@-1, @0], @[@1, @0], @[@0, @-1], @[@0, @1]];
    NSMutableArray<NSArray<NSNumber *> *> *queue = [NSMutableArray new];
    NSMutableSet<NSString *> *visited = [NSMutableSet new];
    [queue addObject:@[@(i), @(j)]];
    [visited addObject:[NSString stringWithFormat:@"%li,%li", i, j]];
    NSInteger step = 1;
    while (queue.count > 0) {
        NSInteger size = queue.count;
        while (size-- > 0) {
            NSArray<NSNumber *> *poll = queue.firstObject;
            [queue removeObjectAtIndex:0];
            for (NSArray<NSNumber *> *dir in dirs) {
                NSInteger x = poll[0].integerValue + dir[0].integerValue,
                y = poll[1].integerValue + dir[1].integerValue;
                NSString *key = [NSString stringWithFormat:@"%li,%li", i, j];
                if (x < 0 || x >= grid.count || y < 0 || y >= grid[x].count ||
                    grid[x][y].integerValue < 3 ||
                    [visited containsObject:key]) continue;
                [visited addObject:key];
                dict[key] = @(dict[key].integerValue + 1);
                grid[x][y] = @(grid[x][y].integerValue + step);
                [queue addObject:@[@(x), @(y)]];
            }
        }
        step++;
    }
}

@end
