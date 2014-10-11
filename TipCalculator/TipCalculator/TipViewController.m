//
//  TipViewController.m
//  TipCalculator
//
//  Created by Raylene Yung on 10/9/14.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIView *dividerBarView;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)loadSettings;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSettings];
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)loadSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger savedTipValue = [defaults integerForKey:PreferredTipKey];
    
    [self.tipControl setSelectedSegmentIndex:savedTipValue];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
    // Animate the bar to display / hide when values are updated
    self.dividerBarView.alpha = 0;
    [UIView animateWithDuration:0.8 animations:^{
        self.dividerBarView.alpha = 1;
    } completion:^(BOOL finished) {
    }];
}

@end
