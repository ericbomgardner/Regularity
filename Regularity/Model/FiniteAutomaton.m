//
//  FiniteAutomaton.m
//  Regularity
//
//  Created by Eric Bomgardner on 8/1/15.
//  Copyright (c) 2015 Eric Bomgardner. All rights reserved.
//

#import "FiniteAutomaton.h"

#import "State.h"
#import "Transition.h"

@implementation FiniteAutomaton {
  NSMutableArray *_transitions;

  /** Used to make transitions easier */
//  NSMutableDictionary *_stateToTransitionsDict;
}

- (instancetype)init {
  return [self initWithName:@"Default FA" transitions:@[]];
}

- (instancetype)initWithName:(NSString *)name transitions:(NSArray *)transitions {
  self = [super init];
  if (self) {
    _name = name;
    _transitions = [transitions mutableCopy];

    [self setCurrentStatesToStartStates];

    // TODO(ericbomgardner): [self generateStateToTransitionsDict];
  }
  return self;
}

- (void)addTransition:(Transition *)transition {
  [_transitions addObject:transition];

  // TODO(ericbomgardner): Update _stateToTransitionsDict
}

- (NSSet *)states {
  NSMutableSet *states = [[NSMutableSet alloc] init];
  for (Transition *transition in self.transitions) {
    [states addObject:transition.beginState];
    [states addObject:transition.endState];
  }
  return states;
}

- (BOOL)transitionByCharacter:(unichar)character {
  NSMutableSet *nextStates = [[NSMutableSet alloc] init];
  for (State *currentState in self.currentStates) {
    // TODO(ericbomgardner): Use _stateToTransitionsDict so we don't have to look through every transition.
    for (Transition *transition in self.transitions) {
      if ([transition.beginState isEqual:currentState] && transition.transitionCharacter == character) {
        [nextStates addObject:transition.endState];
      }
    }
  }
  self.currentStates = nextStates;

  return [self isAutomatonInAcceptedState];
}

- (void)reset {
  [self setCurrentStatesToStartStates];
}

#pragma mark - NSObject

- (NSString *)description {
  return [NSString stringWithFormat:@"%@: %@", self.name, [self.transitions componentsJoinedByString:@", "]];
}

#pragma mark - Private

- (void)setCurrentStatesToStartStates {
  NSMutableSet *currentStates = [[NSMutableSet alloc] init];
  for (State *state in [self states]) {
    if (state.isStartState) {
      [currentStates addObject:state];
    }
  }
  _currentStates = currentStates;
}

- (BOOL)isAutomatonInAcceptedState {
  for (State *currentState in self.currentStates) {
    if (currentState.isAcceptState) {
      return YES;
    }
  }
  return NO;
}

//- (void)generateStateToTransitionsDict {
//  _stateToTransitionsDict =  [[NSMutableDictionary alloc] init];
//  for (Transition *transition in self.transitions) {
//    if ([[self currentStates] containsObject:transition.beginState]) {
//      NSMutableSet *transitionsForState;
//      if (![_stateToTransitionsDict objectForKey:transition.beginState]) {
//        transitionsForState = [[NSMutableSet alloc] init];
//        [_stateToTransitionsDict setObject:transitionsForState forKey:transition.beginState];
//      }
//      [transitionsForState addObject:transition];
//    }
//  }
//}

@end
