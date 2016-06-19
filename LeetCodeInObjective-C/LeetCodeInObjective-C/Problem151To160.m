//
//  Problem151To160.m
//  LeetCodeInObjective-C
//
//  Created by Chengzhi Jia on 5/24/16.
//  Copyright © 2016 ChengzhiJia. All rights reserved.
//

#import "Problem151To160.h"
#import "ListNode.h"

@implementation Problem151To160

/*
 151. Reverse Words in a String
 Given an input string, reverse the string word by word.
 
 For example,
 Given s = "the sky is blue",
 return "blue is sky the".
 
 Update (2015-02-12):
 For C programmers: Try to solve it in-place in O(1) space.
 */
- (NSString *)reverseWords: (NSString *)input {
    NSArray *strArray = [input componentsSeparatedByString:@" "];
    NSMutableString *result = [[NSMutableString alloc]init];
    for (NSInteger index = strArray.count - 1; index >= 0; index--) {
        [result appendString:strArray[index]];
        if (index != 0) {
            [result appendString:@" "];
        }
    }
    return result;
}


@end

/*
 155. Min Stack
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 
 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
 Example:
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> Returns -3.
 minStack.pop();
 minStack.top();      --> Returns 0.
 minStack.getMin();   --> Returns -2.
 Subscribe to see which companies asked this question
 */

@interface MinStack()

@property (nonatomic) ListNode *start;
@property (nonatomic) NSMutableArray<ListNode *> *minArray;

@end

@implementation MinStack

- (instancetype)init
{
    self = [super init];
    if (self) {
        _start = [[ListNode alloc]initWithVal:0];
        _minArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)push:(NSInteger)x {
    ListNode *newNode = [[ListNode alloc]initWithVal:x];
    newNode.next = self.start.next;
    self.start.next = newNode;
    if (self.minArray.count == 0 || self.minArray.lastObject.val >= newNode.val) {
        [self.minArray addObject:newNode];
    }
}

- (void)pop {
    if (self.start.next != nil) {
        ListNode *next = self.start.next;
        self.start.next = next.next;
        if (self.minArray.count != 0 && self.minArray.lastObject.val == next.val) {
            [self.minArray removeLastObject];
        }
        next = nil;
    }
}

- (NSInteger)top {
    return self.start.next != nil ? self.start.next.val : 0;
}

- (NSInteger)getMin {
    if (self.minArray.count != 0) {
        return self.minArray.lastObject.val;
    }
    return 0;
}

@end
