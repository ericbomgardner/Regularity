//
//  FiniteAutomaton.m
//  Regularity
//
//  Created by Eric Bomgardner on 8/1/15.
//  Copyright (c) 2015 Eric Bomgardner. All rights reserved.
//

#import "FiniteAutomaton.h"

@implementation FiniteAutomaton {
  NSMutableArray *_transitions;
}

- (instancetype)init {
  return [self initWithName:@"Default FA" transitions:@[]];
}

- (instancetype)initWithName:(NSString *)name transitions:(NSArray *)transitions {
  self = [super init];
  if (self) {
    _name = name;
    _transitions = [transitions mutableCopy];
  }
  return self;
}

- (void)addTransition:(Transition *)transition {
  [_transitions addObject:transition];
}

@end
