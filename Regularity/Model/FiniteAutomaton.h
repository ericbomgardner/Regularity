//
//  FiniteAutomaton.h
//  Regularity
//
//  Created by Eric Bomgardner on 8/1/15.
//  Copyright (c) 2015 Eric Bomgardner. All rights reserved.
//

@import Foundation;

@class State;
@class Transition;

@interface FiniteAutomaton : NSObject

//
// Initializers & structure management
//

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSArray *transitions;
/** Synthetic property generated from iterating through transitions. */
@property (nonatomic, copy, readonly) NSSet *states;

/** Designated initializer. */
- (instancetype)initWithName:(NSString *)name transitions:(NSArray *)transitions;

- (void)addTransition:(Transition *)transition;

//
// State changes
//

/** The current states. */
@property(nonatomic, copy) NSSet *currentStates;

/**
 * Transitions the automaton by a character. Returns YES if the automaton has at least one accept state in its new
 * current states.
 */
- (BOOL)transitionByCharacter:(unichar)character;

/** Resets the automaton to its start states. */
- (void)reset;

@end
