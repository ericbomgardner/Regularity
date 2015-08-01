//
//  State.h
//  Regularity
//
//  Created by Eric Bomgardner on 8/1/15.
//  Copyright (c) 2015 Eric Bomgardner. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A state in the finite automaton. */
@interface State : NSObject

@property(nonatomic, copy, readonly) NSString *name;
@property(nonatomic, assign, readonly) BOOL isStartState;
@property(nonatomic, assign, readonly) BOOL isAcceptState;

- (instancetype)initWithName:(NSString *)name isStartState:(BOOL)isStartState isAcceptState:(BOOL)isAcceptState;

@end
