//
//  State.m
//  Regularity
//
//  Created by Eric Bomgardner on 8/1/15.
//  Copyright (c) 2015 Eric Bomgardner. All rights reserved.
//

#import "State.h"

@implementation State

- (instancetype)initWithName:(NSString *)name isStartState:(BOOL)isStartState isAcceptState:(BOOL)isAcceptState {
  self = [super init];
  if (self) {
    _name = name;
    _isStartState = isStartState;
    _isAcceptState = isAcceptState;
  }
  return self;
}

@end
