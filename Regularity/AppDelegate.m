//
//  AppDelegate.m
//  Regularity
//
//  Created by Eric Bomgardner on 10/8/14.
//  Copyright (c) 2014 Eric Bomgardner. All rights reserved.
//

#import "AppDelegate.h"

#import "RegexViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

  RegexViewController *test = [[RegexViewController alloc] init];
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:test];
  self.window.rootViewController = navigationController;
  [self.window makeKeyAndVisible];

  return YES;
}

@end
