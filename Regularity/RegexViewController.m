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

- (IBAction)stringValueChanged:(UITextField *)sender {
  NSString *regularExpression = self.regexTextField.text;
  NSString *stringToMatch = self.stringTextField.text;

  NSError *error = NULL;
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularExpression
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
    self.matchLabel.text = @"String matches RegEx!";
  } else {
    self.matchLabel.text = @"String doesn't match!";
  }
}

@end
