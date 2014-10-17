//
//  RSRControlViewController.m
//  RocketSkates-iOS-SDK-Demo
//
//  Created by 印轩 on 14-10-16.
//  Copyright (c) 2014年 ACTON. All rights reserved.
//

#import "RSRControlViewController.h"
#import "RocketSkates_iOS_SDK.h"
#import "RSDataViewController.h"

#define RADIUS 50

@interface RSRControlViewController () <RocketSkates_iOS_SDK_Delegate>

{
    CGPoint _controllerCenter;
}

@property (nonatomic, strong) RocketSkates_iOS_SDK *rocketSkates;

@end

@implementation RSRControlViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _rocketSkates = [RocketSkates_iOS_SDK RocketSkates];
    _rocketSkates.delegate = self;
    [_rocketSkates setControl:@"REMOTE CONTROL"];
    _controllerCenter = _controllerView.center;
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestures:)];
    self.controllerView.userInteractionEnabled = YES;
    panGestureRecognizer.minimumNumberOfTouches = 1;
    panGestureRecognizer.maximumNumberOfTouches = 1;
    [self.controllerView addGestureRecognizer:panGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
}

- (void)handlePanGestures:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) || (gesture.state == UIGestureRecognizerStateBegan)) {
        CGPoint location = [gesture locationInView:self.view];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.1];
        
        CGFloat deltaX = location.x - _controllerCenter.x;
        CGFloat deltaY = _controllerCenter.y - location.y;
        
        CGFloat angleInDegrees = atan2f(deltaY, deltaX) * 180 / M_PI;
        if (angleInDegrees < 0) {
            angleInDegrees += 360;
        }
        
        CGFloat limitX = RADIUS * cos(angleInDegrees * M_PI / 180);
        CGFloat limitY = RADIUS * sin(angleInDegrees * M_PI / 180);
        
        if (deltaX >= fabsf(limitX)) {
            location.x = _controllerCenter.x + fabsf(limitX);
            deltaX = limitX;
        }
        if (deltaY >= fabsf(limitY)) {
            location.y = _controllerCenter.y - fabsf(limitY);
            deltaY = limitY;
        }
        if (deltaX <= -fabsf(limitX)) {
            location.x = _controllerCenter.x - fabsf(limitX);
            deltaX = limitX;
        }
        if (deltaY <= -fabsf(limitY)) {
            location.y = _controllerCenter.y + fabsf(limitY);
            deltaY = limitY;
        }
        
        CGFloat distance = hypot(deltaX,deltaY);
        NSInteger s = distance * 100 / RADIUS;
        
        if (angleInDegrees < 115 && angleInDegrees > 65) {
            angleInDegrees = 90;
        }
        if (angleInDegrees < 205 && angleInDegrees > 155) {
            angleInDegrees = 180;
        }
        if (angleInDegrees < 295 && angleInDegrees > 245) {
            angleInDegrees = 270;
        }
        if (angleInDegrees < 25 && angleInDegrees > 335) {
            angleInDegrees = 0;
        }
        _controllerView.center = location;
        [UIView commitAnimations];
        [_rocketSkates setSpeed:s];
        [_rocketSkates setAngle:(int)angleInDegrees];
        
        _speedLabel.text = [NSString stringWithFormat:@"%d",s];
        _angleLabel.text = [NSString stringWithFormat:@"%d",(int)angleInDegrees];
        
    } else if ((gesture.state == UIGestureRecognizerStateEnded) || (gesture.state == UIGestureRecognizerStateCancelled)) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.1];
        _controllerView.center = _controllerCenter;
        [UIView commitAnimations];
        _angleLabel.text = @"0";
        _speedLabel.text = @"0";
        [_rocketSkates setSpeed:0];
        [_rocketSkates setAngle:90];
    }
    
}


- (IBAction)rcontrolSwitch:(UISwitch *)sender {
    if (![sender isOn]) {
        [_rocketSkates setControl:@"Q"];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }
}

@end
