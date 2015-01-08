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
@property (strong, nonatomic) UIImageView *controllerView;

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
    _controllerView = [[UIImageView alloc] initWithFrame:CGRectMake(135, 465, 50, 50)];
    [_controllerView setImage:[UIImage imageNamed:@"fun_rcontrol_dot.png"]];
    [self.view addSubview:_controllerView];
    _rocketSkates = [RocketSkates_iOS_SDK shareBtManager];
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
    NSLog(@"state:%ld",gesture.state);
    
    if ((gesture.state == UIGestureRecognizerStateChanged) || (gesture.state == UIGestureRecognizerStateBegan)) {
        
        CGPoint location = [gesture locationInView:self.view];
        NSLog(@"location:(%.0f,%.0f)",location.x- _controllerCenter.x,location.y- _controllerCenter.y);
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
        
        [_rocketSkates setSpeed:s];
        [_rocketSkates setAngle:angleInDegrees];
        
        _controllerView.center = location;
        [UIView commitAnimations];
        
    } else if ((gesture.state == UIGestureRecognizerStateEnded) || (gesture.state == UIGestureRecognizerStateCancelled)) {
        [_rocketSkates setSpeed:0];
        [_rocketSkates setAngle:90];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.1];
        
        _controllerView.center = _controllerCenter;
        [UIView commitAnimations];
    }
    NSLog(@"location:(%.0f,%.0f)",_controllerView.center.x - _controllerCenter.x,_controllerView.center.y-_controllerCenter.y);
}

- (IBAction)rcontrolSwitch:(UISwitch *)sender {
    if (![sender isOn]) {
        [_rocketSkates setControl:@"Q"];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }
}

@end
