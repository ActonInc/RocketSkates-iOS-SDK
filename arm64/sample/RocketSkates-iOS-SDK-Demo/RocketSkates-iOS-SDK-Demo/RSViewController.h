//
//  RSViewController.h
//  RocketSkates-iOS-SDK-Demo
//
//  Created by 印轩 on 14-10-14.
//  Copyright (c) 2014年 ACTON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface RSViewController : UIViewController
- (IBAction)bt:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)disconnectBT:(UIButton *)sender;

@end
