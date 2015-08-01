//
//  ViewController.m
//  Regularity
//
//  Created by Eric Bomgardner on 10/8/14.
//  Copyright (c) 2014 Eric Bomgardner. All rights reserved.
//

#import "RegexViewController.h"

@import UIKit.UIScreen;

@interface RegexViewController ()

@property(nonatomic, strong) UITextField *textInputField;

@end

@implementation RegexViewController

- (void)loadView {
  CGRect windowBounds = [[UIScreen mainScreen] applicationFrame];
  UIView *view = [[UIView alloc] initWithFrame:windowBounds];
  view.backgroundColor = [UIColor whiteColor];

  _textInputField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 150, 30)];
  _textInputField.placeholder = @"Input string here.";
  [view addSubview:_textInputField];

  self.view = view;
}


@end
