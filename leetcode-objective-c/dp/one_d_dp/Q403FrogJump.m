//
//  Q403FrogJump.m
//  leetcode-objective-c
//
//  Created by Chengzhi Jia on 5/13/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

#import "Q403FrogJump.h"

@implementation Q403FrogJump

//Difficulty: Hard
//TAG: Apple
//TAG: DP

/**
 * 403. Frog Jump
 * A frog is crossing a river. The river is divided into x units and at each unit there may or may not exist a stone. The frog can jump on a stone, but it must not jump into the water.
 *
 * Given a list of stones' positions (in units) in sorted ascending order, determine if the frog is able to cross the river by landing on the last stone. Initially, the frog is on the first stone and assume the first jump must be 1 unit.
 *
 * If the frog's last jump was k units, then its next jump must be either k - 1, k, or k + 1 units. Note that the frog can only jump in the forward direction.
 *
 * Note:
 *
 * The number of stones is ≥ 2 and is < 1,100.
 * Each stone's position will be a non-negative integer < 231.
 * The first stone's position is always 0.
 * Example 1:
 *
 * [0,1,3,5,6,8,12,17]
 *
 * There are a total of 8 stones.
 * The first stone at the 0th unit, second stone at the 1st unit,
 * third stone at the 3rd unit, and so on...
 * The last stone at the 17th unit.
 *
 * Return true. The frog can jump to the last stone by jumping
 * 1 unit to the 2nd stone, then 2 units to the 3rd stone, then
 * 2 units to the 4th stone, then 3 units to the 6th stone,
 * 4 units to the 7th stone, and 5 units to the 8th stone.
 * Example 2:
 *
 * [0,1,2,3,4,8,9,11]
 *
 * Return false. There is no way to jump to the last stone as
 * the gap between the 5th and 6th stone is too large.
 */

/*
 Solution 1:
 dp, assign a dp list with sets in it, each set represent all possible last steps reach to here
 loop the dp list, for each set, loop each possible steps, try to reach to step - 1 + stone, step + stone, step + 1 + stone
 see if there's proper stone after, if so, update related after dp set with this step
 
 Time: O(n^2)
 Space: O(n)
 */

/*
Solution 2:
Similar to solution 1, use map <stone, set> instead of dp list, so that when we check if there's matched stone after
we don't need the j loop

Time: O(n)
Space: O(n)
*/

- (BOOL)canCross: (NSArray<NSNumber *> *)stones {
    NSMutableDictionary<NSNumber *, NSMutableSet<NSNumber *> *> *dict = [NSMutableDictionary new];
    dict[@0] = [NSMutableSet setWithObject:@0];
    [stones enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dict[obj] = [NSMutableSet new];
    }];
    for (NSInteger i = 0; i < stones.count - 1; i++) {
        NSNumber *stone = stones[i];
        for (NSNumber *step in dict[stone]) {
            NSInteger reach = step.integerValue + stone.integerValue;
            if (ABS(reach - stones.lastObject.integerValue) <= 1) return YES;
            if (step > 0 && dict[@(reach)]) [dict[@(reach)] addObject:step];
            if (step.integerValue - 1 > 0 && dict[@(step.integerValue - 1)]) [dict[@(step.integerValue - 1)] addObject:@(step.integerValue - 1)];
            if (dict[@(step.integerValue + 1)]) [dict[@(step.integerValue + 1)] addObject:@(step.integerValue + 1)];
        }
    }
    return NO;
}

@end
