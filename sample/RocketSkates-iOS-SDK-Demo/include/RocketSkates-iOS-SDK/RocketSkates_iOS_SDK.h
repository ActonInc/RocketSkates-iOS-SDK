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

@protocol RocketSkates_iOS_SDK_Delegate <NSObject>

@optional
- (void)RocketSkates:(RocketSkates_iOS_SDK *)rocketSkates didFindDevices:(NSArray *)devices;
- (void)RocketSkatesConnected;
- (void)RocketSkatesDisconnected;
- (void)RocketSkatesDidRecv:(NSArray *)recvArray;

@end


@interface RocketSkates_iOS_SDK : NSObject <BTSmartSensorDelegate>

@property (nonatomic, assign) id <RocketSkates_iOS_SDK_Delegate> delegate;

@property (nonatomic, strong) NSString *mode;
@property (nonatomic, assign) NSInteger weight;
@property (nonatomic, strong) NSString *control;
@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger angle;

+ (RocketSkates_iOS_SDK *)RocketSkates;
- (void)startBtService;
- (void)scanStart;
- (void)scanStop;

- (void)connect:(CBPeripheral *)connectPeri;
- (void)disconnect;
@end
