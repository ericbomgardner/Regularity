//
//  Transition.m
//  Regularity
//
//  Created by Eric Bomgardner on 8/1/15.
//  Copyright (c) 2015 Eric Bomgardner. All rights reserved.
//

#import "Transition.h"

#import "State.h"

@implementation Transition

- (NSString *)description {
  return [NSString stringWithFormat:@"{%@, %@}", self.beginState, self.endState];
}

#pragma mark - NSObject

- (BOOL)isEqual:(id)object {
  if (self == object) {
    return YES;
  }

  if (![object isKindOfClass:[Transition class]]) {
    return NO;
  }

  Transition *transition = object;
  return [self.beginState isEqual:transition.beginState]
      && [self.endState isEqual:transition.endState]
      && self.transitionCharacter == transition.transitionCharacter;
}

- (NSUInteger)hash {
  return [self.beginState hash] ^ [self.endState hash] ^ self.transitionCharacter;
}


@end
