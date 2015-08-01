//
//  ViewController.m
//  Regularity
//
//  Created by Eric Bomgardner on 10/8/14.
//  Copyright (c) 2014 Eric Bomgardner. All rights reserved.
//

#import "RegexViewController.h"

@import UIKit.UILabel;
@import UIKit.UIScreen;

@interface RegexViewController ()
@property (weak, nonatomic) IBOutlet UITextField *regexTextField;
@property (weak, nonatomic) IBOutlet UITextField *stringTextField;
@property (weak, nonatomic) IBOutlet UILabel *matchLabel;
@end

@implementation RegexViewController

- (void)viewDidLoad {
  self.title = @"Evaluate a Regular Expression";
}

- (IBAction)stringValueChanged:(UITextField *)sender {
  NSString *regularExpressionString = self.regexTextField.text;
  NSString *stringToMatch = self.stringTextField.text;

  NSError *error = NULL;
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularExpressionString
                                                                         options:0
                                                                           error:&error];

  __block BOOL foundAMatch = NO;
  NSRange fullStringRange = NSMakeRange(0, [stringToMatch length]);
  [regex enumerateMatchesInString:stringToMatch
                          options:0
                            range:fullStringRange
                       usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                         if (NSEqualRanges(result.range, fullStringRange)) {
                           foundAMatch = YES;
                           *stop = YES;
                         }
                       }];

  if (foundAMatch) {
    self.stringTextField.textColor = [UIColor colorWithRed:0.f green:0.4f blue:0.f alpha:1.f];
    self.matchLabel.text = @"String matches";
  } else if ([regularExpressionString length] && [stringToMatch length]){
    self.stringTextField.textColor = [UIColor redColor];
    self.matchLabel.text = @"String doesn't match";
  } else {
    self.stringTextField.textColor = [UIColor blackColor];
    self.matchLabel.text = @"";
  }
}

@end
