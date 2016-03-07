//
//  SettingTableViewController.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/29.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "SettingTableViewController.h"

#import "SettingModel.h"
#import "SettingGroupModel.h"
#import "SettingTableViewCell.h"
#import "SettingModelArray.h"
#import "SettingModelSwitch.h"
#import "SettingModelProduct.h"
#import "TestViewController.h"
#import "MBProgressHUD+MJ.h"
#import "ProductCollectionViewController.h"
#import "PushController.h"


@interface SettingTableViewController ()



@end

@implementation SettingTableViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 添加tableView中的数据
    // 因为继承自父类“BaseTableViewController”，所以其余操作都由父类实现
    [self addGroups];
    
}

-(void) addGroups
{
    
    // 第0组
    // “推送和提醒”
    SettingModelArray *pushNotice = [SettingModelArray settingModelWithIcon:@"MoreMessage"
                                                                      title:@"推送和提醒"
                                                              destinationVC:[PushController class]];
    // “摇一摇机选”
    SettingModel *yaoyiyao = [SettingModelSwitch settingModelWithIcon:@"handShake" title:@"摇一摇机选"];
    
    // “声音效果”
    SettingModelArray *sound = [SettingModelArray settingModelWithIcon:@"sound_Effect"
                                                                 title:@"声音效果"
                                                         destinationVC:[TestViewController class]];
    
    SettingGroupModel *group0 = [[SettingGroupModel alloc] init];
    group0.items = @[pushNotice,yaoyiyao,sound];
    group0.header = @"这是header";
    group0.footer = @"这是footer";
    
    
    // 第一组
    // “检查新版本”
    SettingModel *newVersion = [SettingModelArray settingModelWithIcon:@"MoreUpdate"
                                                                 title:@"检查新版本"
                                                         destinationVC:nil];
    
    newVersion.updateBlock = ^{
        
        // 1.添加蒙版
        [MBProgressHUD showMessage:@"正在检查更新"];
        
        // 2.模拟网络延迟操作
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 3.取消蒙版
            [MBProgressHUD hideHUD];
            
            // 4.弹窗提示
            UIAlertController *alController = [UIAlertController alertControllerWithTitle:@"检查到新版本" message:@"是否更新？" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *updateAction = [UIAlertAction actionWithTitle:@"立即更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"稍后提示" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alController addAction:updateAction];
            [alController addAction:cancelAction];
            
            [self presentViewController:alController animated:YES completion:^{
                
            }];
            
            
            
        });
    };
    
    // “帮助”
    SettingModel *help = [SettingModelArray settingModelWithIcon:@"MoreHelp"
                                                           title:@"帮助"
                                                   destinationVC:[TestViewController class]];
    
    // “分享”
    SettingModel *share = [SettingModelArray settingModelWithIcon:@"MoreShare"
                                                            title:@"分享"
                                                    destinationVC:[TestViewController class]];
    
    // “查看消息”
    SettingModel *message = [SettingModelArray settingModelWithIcon:@"MoreMessage"
                                                              title:@"查看消息"
                                                      destinationVC:[TestViewController class]];
    
    // “产品推荐”
    SettingModel *more = [SettingModelArray settingModelWithIcon:@"MoreNetease"
                                                           title:@"产品推荐"
                                                   destinationVC:[ProductCollectionViewController class]];
    
    // “关于”
    SettingModel *about = [SettingModelArray settingModelWithIcon:@"MoreAbout"
                                                            title:@"关于"
                                                    destinationVC:[TestViewController class]];
    
    SettingGroupModel *group1 = [[SettingGroupModel alloc] init];
    group1.items = @[newVersion,help,share,message,more,about];
    group1.header = @"这是header";
    group1.footer = @"这是footer";
    
    [self.dataList addObject:group0];
    [self.dataList addObject:group1];
}




@end
