//
//  RSDataViewController.m
//  RocketSkates-iOS-SDK-Demo
//
//  Created by 印轩 on 14-10-15.
//  Copyright (c) 2014年 ACTON. All rights reserved.
//

#import "RSDataViewController.h"
#import "RocketSkates_iOS_SDK.h"
#import "RSRControlViewController.h"

@interface RSDataViewController () <RocketSkates_iOS_SDK_Delegate>

@property (nonatomic, strong) RocketSkates_iOS_SDK *rocketSkates;

@end

@implementation RSDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [storyboard instantiateViewControllerWithIdentifier:@"data"];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    _rocketSkates = [RocketSkates_iOS_SDK RocketSkates];
    _rocketSkates.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [_RCSwitch setOn:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)RocketSkatesDidRecv:(NSArray *)recvArray
{
    NSLog(@"recved:%@",recvArray);
    
    if (recvArray.count > 0) {
        NSDictionary *leaderDict = recvArray[0];
        _LNameLabel.text = leaderDict[@"name"];
        _LVoltageLabel.text = leaderDict[@"voltage"];
        _LCurrentLabel.text = leaderDict[@"current"];
        _LCapacityLabel.text = leaderDict[@"capacity"];
        _LTempLabel.text = leaderDict[@"temp"];
        _LSpeedLabel.text = leaderDict[@"speed"];
        _LStateLabel.text = leaderDict[@"state"];
        _LModeLabel.text = leaderDict[@"mode"];
        _LWeightLabel.text = leaderDict[@"weight"];
        _faultLabel.text = leaderDict[@"faultCode"];
    }
    if (recvArray.count > 1) {
        NSDictionary *followerDict = recvArray[1];
        _FNameLabel.text = followerDict[@"name"];
        _FVoltageLabel.text = followerDict[@"voltage"];
        _FCurrentLabel.text = followerDict[@"current"];
        _FCapacityLabel.text = followerDict[@"capacity"];
        _FTempLabel.text = followerDict[@"temp"];
        _FSpeedLabel.text = followerDict[@"speed"];
        _FStateLabel.text = followerDict[@"state"];
        _FModeLabel.text = followerDict[@"mode"];
        _FWeightLabel.text = followerDict[@"weight"];
    }
    
    
//    if ([leaderDict[@"mode"] isEqualToString:@"Beginner"]) {
//        [_segmentController setSelectedSegmentIndex:0];
//    } else if ([leaderDict[@"mode"] isEqualToString:@"Normal"]) {
//        [_segmentController setSelectedSegmentIndex:1];
//    } else if ([leaderDict[@"mode"] isEqualToString:@"Pro"]) {
//        [_segmentController setSelectedSegmentIndex:2];
//    }
    
//    if ([leaderDict[@"state"] isEqualToString:@"LOCKED"]) {
//        [_lockSwitch setOn:NO];
//        [_lockLabel setText:@"LOCKED"];
//    } else {
//        [_lockSwitch setOn:YES];
//        [_lockLabel setText:@"UNLOCKED"];
//    }
}

- (IBAction)modeSegmented:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        [_rocketSkates setMode:@"BEGINNER"];
    } else if (sender.selectedSegmentIndex == 1) {
        [_rocketSkates setMode:@"NORMAL"];
    } else if (sender.selectedSegmentIndex == 2) {
        [_rocketSkates setMode:@"PRO"];
    }
    
}

- (IBAction)weightSlider:(UISlider *)sender {
    NSString *weight = [NSString stringWithFormat:@"%.0f",sender.value];
    _weightLabel.text = weight;
    [_rocketSkates setWeight:[weight integerValue]];
}

- (IBAction)rcontrolSwitch:(UISwitch *)sender {
    if ([sender isOn]) {
        RSRControlViewController *rControl = [[RSRControlViewController alloc] init];
        [self presentViewController:rControl animated:YES completion:nil];
    }
}
@end
