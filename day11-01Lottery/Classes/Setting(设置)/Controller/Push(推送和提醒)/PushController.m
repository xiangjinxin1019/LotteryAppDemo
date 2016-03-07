//
//  PushController.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/3/6.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "PushController.h"

#import "SettingModel.h"
#import "SettingGroupModel.h"
#import "SettingTableViewCell.h"
#import "SettingModelArray.h"
#import "SettingModelSwitch.h"
#import "SettingModelProduct.h"
#import "TestViewController.h"
#import "MBProgressHUD+MJ.h"
#import "ProductCollectionViewController.h"
#import "TimeReminderController.h"


@interface PushController ()


@end


@implementation PushController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 添加tableView中的数据
    // 因为继承自父类“BaseTableViewController”，所以其余操作都由父类实现
    [self addGroup0];

    
}

-(void) addGroup0
{
    
    // 第0组
    // “开奖号码推送”
    SettingModelArray *push = [SettingModelArray settingModelWithIcon:nil
                                                                title:@"开奖号码推送"
                                                        destinationVC:[TestViewController class]];
    // “中奖动画”
    SettingModelArray *animation = [SettingModelArray settingModelWithIcon:nil
                                                                     title:@"中奖动画"
                                                             destinationVC:[TestViewController class]];
    
    // “比分直播提醒”
    SettingModelArray *score = [SettingModelArray settingModelWithIcon:nil
                                                                 title:@"比分直播提醒"
                                                         destinationVC:[TestViewController class]];
    
    // “购彩定时提醒”
    SettingModelArray *time = [SettingModelArray settingModelWithIcon:nil
                                                                title:@"购彩定时提醒"
                                                        destinationVC:[TimeReminderController class]];
    
    SettingGroupModel *group0 = [[SettingGroupModel alloc] init];
    group0.items = @[push,animation,score,time];
    group0.header = @"这是header";
    group0.footer = @"这是footer";
    
    
    [self.dataList addObject:group0];

}


@end

    

