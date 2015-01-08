//
//  RocketSkates_iOS_SDK.h
//  RocketSkates_iOS_SDK
//
//  Created by 印轩 on 15/1/8.
//  Copyright (c) 2015年 ACTON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerialGATT.h"
#import <UIKit/UIKit.h>

@protocol RocketSkates_iOS_SDK_Delegate <NSObject>

@optional
- (void)didFindDevices:(NSArray *)devices;
- (void)RocketSkatesConnected;
- (void)RocketSkatesDisconnected;
- (void)isRecved;
- (void)noDeviceFound;
- (void)RocketSkatesDidRecv:(NSArray *)recvArray;

@end

@interface RocketSkates_iOS_SDK : NSObject <BTSmartSensorDelegate>

@property (nonatomic, assign) id<RocketSkates_iOS_SDK_Delegate>delegate;
@property (strong, nonatomic) SerialGATT *sensor;
@property(nonatomic,readonly)BOOL isConnected;

@property (nonatomic, strong) NSString *mode;
@property (nonatomic, assign) NSInteger weight;
@property (nonatomic, strong) NSString *control;
@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger angle;
@property (nonatomic, assign) CGFloat mileage;
@property (nonatomic, strong) NSDate* startTime;

- (void)startBtService;//蓝牙初始化
- (void)scanStart;//开始扫描
- (void)scanStop;//停止扫描
- (BOOL)lookupBtStatus;
+ (RocketSkates_iOS_SDK *)shareBtManager;
- (void)sendGeneral;

- (void)connect:(CBPeripheral *)connectPeri;//连接给定的蓝牙设备
- (void)disconnect;//断开连接
- (CBPeripheral *)getActivePeripheral;
- (void)sendData:(NSMutableData *)data;
- (NSData *)getRecvData;
- (NSArray *)getfoundPeripherals;

@end
