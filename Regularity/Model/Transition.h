//
//  Transition.h
//  Regularity
//
//  Created by Eric Bomgardner on 8/1/15.
//  Copyright (c) 2015 Eric Bomgardner. All rights reserved.
//

@import Foundation;

@class State;

/** A transition between two States in the finite automaton. */
@interface Transition : NSObject

@property(nonatomic, strong, readonly) State *beginState;
@property(nonatomic, strong, readonly) State *endState;
@property(nonatomic, assign, readonly) unichar transitionCharacter;

@end
