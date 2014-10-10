//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Raylene Yung on 10/9/14.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *preferredTipControl;
- (IBAction)preferredTipSelected:(id)sender;

@end

@implementation SettingsViewController

NSString *const PreferredTipKey = @"preferred_tip_key";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Loading
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger savedTipValue = [defaults integerForKey:PreferredTipKey];
    
    [self.preferredTipControl setSelectedSegmentIndex:savedTipValue];
}

- (IBAction)preferredTipSelected:(id)sender {
     // Saving
    NSInteger preferredTipChoice = self.preferredTipControl.selectedSegmentIndex;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:preferredTipChoice forKey:PreferredTipKey];
    [defaults synchronize];
}
@end
