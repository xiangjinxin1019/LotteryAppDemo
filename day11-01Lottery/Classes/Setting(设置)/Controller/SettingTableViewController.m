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

#import "TestViewController.h"

@interface SettingTableViewController ()

@property (nonatomic,strong) NSMutableArray *dataList;

@end

@implementation SettingTableViewController

/**重写init方法*/
-(instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


/**数据列表*/
-(NSMutableArray *)dataList
{
    
    if (_dataList == nil) {
        
        _dataList = [NSMutableArray array];
        
        // 第0组
        SettingModelArray *pushNotice = [SettingModelArray settingModelWithIcon:@"MoreMessage" title:@"推送和提醒"];
        
        pushNotice.destinationVC = [TestViewController class];
        
        SettingModel *yaoyiyao = [SettingModelSwitch settingModelWithIcon:@"handShake" title:@"摇一摇"];
        SettingGroupModel *group0 = [[SettingGroupModel alloc] init];
        group0.items = @[pushNotice,yaoyiyao];
        group0.header = @"这是header";
        group0.footer = @"这是footer";
        
        
        // 第一组
        SettingModel *newVersion = [SettingModel settingModelWithIcon:@"MoreUpdate" title:@"检查新版本"];
        SettingModel *help = [SettingModel settingModelWithIcon:@"MoreHelp" title:@"帮助"];
        SettingGroupModel *group1 = [[SettingGroupModel alloc] init];
        
        group1.items = @[newVersion,help];
        group1.header = @"这是header";
        group1.footer = @"这是footer";
        
        [_dataList addObject:group0];
        [_dataList addObject:group1];
        
    }
    
    return _dataList;
}


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
    
    // 得到模型
    SettingGroupModel *group = self.dataList[indexPath.section];
    SettingModel *model = group.items[indexPath.row];
    
    // 创建跳转控制器
    if ( [model isKindOfClass:[SettingModelArray class]] ) {
        
        SettingModelArray *arrow = (SettingModelArray *)model;
        
        UIViewController *vc = [[arrow.destinationVC alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
