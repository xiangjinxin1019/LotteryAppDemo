//
//  TimeReminderController.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/3/6.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "TimeReminderController.h"



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

#import "SettingModelLabel.h"


@interface TimeReminderController ()

@property (nonatomic,strong) SettingModelLabel *notice1;
@property (nonatomic,strong) SettingModelLabel *notice2;

@end


@implementation TimeReminderController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 添加tableView中的数据
    // 因为继承自父类“BaseTableViewController”，所以其余操作都由父类实现
    [self addGroup0];
    
    [self addGroup1];
    
    [self addGroup2];
    
    
}

-(void) addGroup0
{
    
    SettingModelSwitch *notice = [SettingModelSwitch settingModelWithIcon:nil title:@"提醒我关注比赛"];
    
    SettingGroupModel *group0 = [[SettingGroupModel alloc] init];
    group0.items = @[notice];
    group0.footer = @"这是footer";
    
    [self.dataList addObject:group0];
}

-(void) addGroup1
{
    
    SettingModelLabel *notice = [SettingModelLabel settingModelWithIcon:nil title:@"开始时间"];
    self.notice1 = notice;
    
    notice.text = [[NSUserDefaults standardUserDefaults] objectForKey:_notice1.title];
    
    if (!notice.text.length) {
        
        notice.text = @"00:00";
        
    }
    
    self.notice1 = notice;
    
    notice.updateBlock = ^{
    
        UITextField *textField = [[UITextField alloc] init];
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode = UIDatePickerModeTime;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
        datePicker.date = [dateFormatter dateFromString:@"00:00"];
        
        
        textField.inputView = datePicker;
        
        [datePicker addTarget:self action:@selector(valueChanged1:) forControlEvents:UIControlEventValueChanged];
        
        [self.view addSubview:textField];
        
        [textField becomeFirstResponder];
        
    };
    
    
    SettingGroupModel *group1 = [[SettingGroupModel alloc] init];
    group1.items = @[notice];
    
    group1.footer = @"这是footer";
    
    [self.dataList addObject:group1];

    
}

-(void) settingDateStringWithDatePicker:(UIDatePicker *)datePicker
                                       :(SettingModelLabel *)notice
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
    NSString *dateStr = [dateFormatter stringFromDate:datePicker.date];
    
    notice.text = dateStr;
    
    [[NSUserDefaults standardUserDefaults] setObject:dateStr forKey:notice.title];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.tableView reloadData];
    
    NSLog(@"%@",notice.text);
}


-(void) valueChanged1:(UIDatePicker *)datePicker
{
    
    [self settingDateStringWithDatePicker:datePicker :_notice1];

}


-(void) addGroup2
{
    SettingModelLabel *notice2 = [SettingModelLabel settingModelWithIcon:nil title:@"结束时间"];
    
     _notice2 = notice2;
    
    notice2.text = [[NSUserDefaults standardUserDefaults] objectForKey:_notice2.title];
    
    if (!notice2.text.length) {
        
        notice2.text = @"00:00";
        
    }
    
    
    
    notice2.updateBlock = ^{
        
        UITextField *textField = [[UITextField alloc] init];
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode = UIDatePickerModeTime;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
        datePicker.date = [dateFormatter dateFromString:@"00:00"];
        
        [datePicker addTarget:self action:@selector(valueChanged2:) forControlEvents:UIControlEventValueChanged];
        
        textField.inputView = datePicker;
        
        [self.view addSubview:textField];
        
        [textField becomeFirstResponder];
        
        
    };
    
    SettingGroupModel *group1 = [[SettingGroupModel alloc] init];
    group1.items = @[notice2];
    group1.footer = @"这是footer";
    
    [self.dataList addObject:group1];
}

-(void) valueChanged2:(UIDatePicker *)datePicker
{
    
    [self settingDateStringWithDatePicker:datePicker :_notice2];

}


@end