//
//  RSRControlViewController.h
//  RocketSkates-iOS-SDK-Demo
//
//  Created by 印轩 on 14-10-16.
//  Copyright (c) 2014年 ACTON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSRControlViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *LNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *LVoltageLabel;
@property (weak, nonatomic) IBOutlet UILabel *LCurrentLabel;
@property (weak, nonatomic) IBOutlet UILabel *LCapacityLabel;
@property (weak, nonatomic) IBOutlet UILabel *LTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *LSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *LStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *LModeLabel;
@property (weak, nonatomic) IBOutlet UILabel *LWeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *faultLabel;
- (IBAction)rcontrolSwitch:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UISwitch *rcSwitch;

@end
