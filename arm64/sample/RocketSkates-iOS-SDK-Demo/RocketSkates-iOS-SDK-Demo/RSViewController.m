//
//  RSViewController.m
//  RocketSkates-iOS-SDK-Demo
//
//  Created by 印轩 on 14-10-14.
//  Copyright (c) 2014年 ACTON. All rights reserved.
//

#import "RSViewController.h"
#import "RocketSkates_iOS_SDK.h"
#import "RSDataViewController.h"

@interface RSViewController ()<RocketSkates_iOS_SDK_Delegate, UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) RocketSkates_iOS_SDK *rocketSkates;
@property (nonatomic, strong) NSMutableArray *devicesList;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation RSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _rocketSkates = [RocketSkates_iOS_SDK shareBtManager];
    [_rocketSkates startBtService];
    _rocketSkates.delegate = self;
    
    [_rocketSkates setWeight:30];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    _rocketSkates = [RocketSkates_iOS_SDK shareBtManager];
    _rocketSkates.delegate = self;
    _devicesList = [NSMutableArray array];
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bt:(id)sender {
    [_devicesList removeAllObjects];
    [_tableView reloadData];
    [_rocketSkates scanStart];
}

-(void)didFindDevices:(NSArray *)devices
{
    _devicesList = [NSMutableArray arrayWithArray:devices];
    [_tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _devicesList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBPeripheral *peripheral = _devicesList[indexPath.row];
    static NSString *ID = @"cell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = peripheral.name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBPeripheral *peripheral = _devicesList[indexPath.row];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [_rocketSkates connect:peripheral];
        dispatch_async(dispatch_get_main_queue(), ^{
            RSDataViewController *dataView = [[RSDataViewController alloc] init];
            [self.navigationController pushViewController:dataView animated:YES];
        });
    });
}

-(void)RocketSkatesConnected
{
    NSLog(@"connected");
}

- (IBAction)disconnectBT:(UIButton *)sender {
    [_rocketSkates disconnect];
}

-(void)RocketSkatesDisconnected
{
   NSLog(@"disconnected"); 
}

@end
