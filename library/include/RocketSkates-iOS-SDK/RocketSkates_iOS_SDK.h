//
//  RocketSkates_iOS_SDK.h
//  RocketSkates-iOS-SDK
//
//  Created by 印轩 on 14-10-14.
//  Copyright (c) 2014年 ACTON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerialGATT.h"

@class RocketSkates_iOS_SDK;


// rocketskates sdk delegate
@protocol RocketSkates_iOS_SDK_Delegate <NSObject>

@optional

// found devices when scanning, a list of CBPeripheral
- (void)RocketSkates:(RocketSkates_iOS_SDK *)rocketSkates didFindDevices:(NSArray *)devices;
- (void)RocketSkatesConnected;
- (void)RocketSkatesDisconnected;
// informations from skates
- (void)RocketSkatesDidRecv:(NSArray *)recvArray;

@end


@interface RocketSkates_iOS_SDK : NSObject <BTSmartSensorDelegate>

@property (nonatomic, assign) id <RocketSkates_iOS_SDK_Delegate> delegate;
//should setMode: @"BEGINNER" or @"NORMAL" or @"PRO" to change,otherwise, you can't change mode
@property (nonatomic, strong) NSString *mode;
//weight should be integer from 50 to 250 (lbs)
@property (nonatomic, assign) NSInteger weight;
//should setControl: @"LOCK" or @"UNLOCK" or @"REMOTE CONTROL" to change
@property (nonatomic, strong) NSString *control;

//these two parameter is only for Remote Control, speed should be 0 ~ 100, angle should be 0 ~ 360, on other state, setSpeed and setAngle won't work
@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger angle;


// Init rocket skate object, this will be init just once and then when you call this function, you just get the one already exist.
+ (RocketSkates_iOS_SDK *)RocketSkates;
//just need to call once as well as you first call above function
- (void)startBtService;
//scan device (rocket skates)
- (void)scanStart;
- (void)scanStop;

//connect to rocket skates
- (void)connect:(CBPeripheral *)connectPeri;

- (void)disconnect;
@end
