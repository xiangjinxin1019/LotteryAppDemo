//
//  BaseTableViewController.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/3/6.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "BaseTableViewController.h"

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

@interface BaseTableViewController ()



@end

@implementation BaseTableViewController


#pragma mark - 初始化dataList
-(NSMutableArray *)dataList
{
    
    if (_dataList == nil) {
        
        _dataList = [NSMutableArray array];
        
    }
    
    return _dataList;
}



/**重写init方法*/
-(instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


#pragma mark - viewDidLoad方法:
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView数据源方法:

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataList.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SettingGroupModel *group = self.dataList[section];
    return group.items.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 初始化cell(已封装)
    SettingTableViewCell *cell = [SettingTableViewCell cellWithTableView:tableView];
    
    // 得到数据模型
    SettingGroupModel *group = self.dataList[indexPath.section];
    SettingModel *model = group.items[indexPath.row];
    
    // 设置cell数据(已封装)
    cell.model = model;
    
    
    return cell;
    
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    SettingGroupModel *group = self.dataList[section];
    return group.header;
    
}


-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    
    SettingGroupModel *group = self.dataList[section];
    return group.footer;
}



#pragma mark - tableView代理方法:
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 得到模型
    SettingGroupModel *group = self.dataList[indexPath.section];
    SettingModel *model = group.items[indexPath.row];
    
    
    // 判断是否是检查更新的操作
    if (model.updateBlock) {
        
        model.updateBlock();  // 执行block中保存的块内容
        
    }
    
    
    // 创建跳转控制器
    if ( [model isKindOfClass:[SettingModelArray class]] ) {
        
        SettingModelArray *arrow = (SettingModelArray *)model;
        
        UIViewController *vc = [[arrow.destinationVC alloc] init];
        
        vc.title = arrow.title;
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}


@end
