//
//  SettingTableViewCell.h
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/29.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingModel;

@interface SettingTableViewCell : UITableViewCell

@property (nonatomic,strong) SettingModel *model;

+(instancetype) cellWithTableView:(UITableView *)tableView;

@end
