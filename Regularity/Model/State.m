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

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
  return self;
}

#pragma mark - NSObject

- (NSString *)description {
  return self.name;
}

- (BOOL)isEqual:(id)object {
  if (self == object) {
    return YES;
  }

  if (![object isKindOfClass:[State class]]) {
    return NO;
  }

  State *state = object;
  return [self.name isEqual:state]
      && self.isStartState == state.isStartState
      && self.isAcceptState == state.isAcceptState;
}

- (NSUInteger)hash {
  return [self.name hash] ^ self.isStartState ^ self.isAcceptState;
}


@end
