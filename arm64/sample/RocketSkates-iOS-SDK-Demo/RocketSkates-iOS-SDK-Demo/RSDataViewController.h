//
//  RSDataViewController.h
//  RocketSkates-iOS-SDK-Demo
//
//  Created by 印轩 on 14-10-15.
//  Copyright (c) 2014年 ACTON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSDataViewController : UIViewController

//Leader Data Labels
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

//Follower Data Labels
@property (weak, nonatomic) IBOutlet UILabel *FNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *FVoltageLabel;
@property (weak, nonatomic) IBOutlet UILabel *FCurrentLabel;
@property (weak, nonatomic) IBOutlet UILabel *FCapacityLabel;
@property (weak, nonatomic) IBOutlet UILabel *FTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *FSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *FStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *FModeLabel;
@property (weak, nonatomic) IBOutlet UILabel *FWeightLabel;

// setting some parameters
- (IBAction)modeSegmented:(UISegmentedControl *)sender;

- (IBAction)weightSlider:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak, nonatomic) IBOutlet UISlider *weightSlider;
- (IBAction)rcontrolSwitch:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UISwitch *RCSwitch;

@end
