//
//  Q785IsGraphBipartite.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/19/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q785IsGraphBipartite.h"

@implementation Q785IsGraphBipartite

//Difficulty: medium
//TAG: Apple
//TAG: DFS
//TAG: BFS

/**
 * 785. Is Graph Bipartite?
 * Given an undirected graph, return true if and only if it is bipartite.
 *
 * Recall that a graph is bipartite if we can split it's set of nodes into two independent subsets A and B such that every edge in the graph has one node in A and another node in B.
 *
 * The graph is given in the following form: graph[i] is a list of indexes j for which the edge between nodes i and j exists.  Each node is an integer between 0 and graph.length - 1.  There are no self edges or parallel edges: graph[i] does not contain i, and it doesn't contain any element twice.
 *
 * Example 1:
 * Input: [[1,3], [0,2], [1,3], [0,2]]
 * Output: true
 * Explanation:
 * The graph looks like this:
 * 0----1
 * |    |
 * |    |
 * 3----2
 * We can divide the vertices into two groups: {0, 2} and {1, 3}.
 * Example 2:
 * Input: [[1,2,3], [0,2], [0,1,3], [0,2]]
 * Output: false
 * Explanation:
 * The graph looks like this:
 * 0----1
 * | \  |
 * |  \ |
 * 3----2
 * We cannot find a way to divide the set of nodes into two independent subsets.
 *
 *
 * Note:
 *
 * graph will have length in range [1, 100].
 * graph[i] will contain integers in range [0, graph.length - 1].
 * graph[i] will not contain i or duplicate values.
 * The graph is undirected: if any element j is in graph[i], then i will be in graph[j].
 */

/*
 Solution:
 The question actually is: e.g. if graph[i][j] = 1, then 1 is connected to all numbers in graph[1]
 */

/*
 Solution 1:
 DFS
 */

- (BOOL)isBipartite: (NSArray<NSArray<NSNumber *> *> *)graph {
    NSMutableArray<NSMutableArray<NSNumber *> *> *mut = [NSMutableArray new];
    for (NSArray<NSNumber *> *detail in graph) [mut addObject:[detail mutableCopy]];
    NSMutableArray<NSNumber *> *colors = [NSMutableArray new];
    for (NSInteger i = 0; i < graph.count; i++) [colors addObject:@0];
    for (NSInteger i = 0; i < colors.count; i++) {
        if ([colors[i] isEqualToNumber:@0]) {
            if (![self dfs:mut colors:colors color:1 index:i]) return NO;
        }
    }
    return YES;
}

- (BOOL)dfs: (NSMutableArray<NSMutableArray<NSNumber *> *> *)graph colors: (NSMutableArray<NSNumber *> *)colors
      color: (NSInteger)color index: (NSInteger)index {
    if (![colors[index] isEqualToNumber:@0])
        return [colors[index] isEqualToNumber:@(color)];
    colors[index] = @(color);
    for (NSNumber *next in graph[index]) {
        if (![self dfs:graph colors:colors color:-color index:next.integerValue])
            return NO;
    }
    return YES;
}

/*
 Solution 2:
 BFS
 */

- (BOOL)isBipartite2: (NSArray<NSArray<NSNumber *> *> *)graph {
    NSMutableArray<NSMutableArray<NSNumber *> *> *mut = [NSMutableArray new];
    for (NSArray<NSNumber *> *detail in graph) [mut addObject:[detail mutableCopy]];
    NSMutableArray<NSNumber *> *colors = [NSMutableArray new];
    for (NSInteger i = 0; i < graph.count; i++) [colors addObject:@0];
    for (NSInteger i = 0; i < colors.count; i++) {
        if ([colors[i] isEqualToNumber:@0]) {
            NSMutableArray<NSNumber *> *queue = [NSMutableArray new];
            colors[i] = @1;
            [queue addObject:@(i)];
            while (queue.count > 0) {
                NSNumber *poll = queue.firstObject;
                [queue removeObjectAtIndex:0];
                for (NSNumber *next in graph[poll.integerValue]) {
                    if ([colors[next.integerValue] isEqualToNumber:@0]) {
                        colors[next.integerValue] = [poll isEqualToNumber:@1] ? @2 : @1;
                        [queue addObject:next];
                    } else if (colors[next.integerValue] == colors[poll.integerValue]) return NO;
                }
            }
        }
    }
    return YES;
}

@end
