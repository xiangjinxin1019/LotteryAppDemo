//
//  SettingTableViewCell.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/29.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "SettingTableViewCell.h"

#import "SettingModelArray.h"
#import "SettingModelSwitch.h"

#import "SettingModel.h"
#import "SettingModelProduct.h"


@interface SettingTableViewCell ()

@property (nonatomic, strong) UISwitch *switchView;

@property (nonatomic, strong) UIImageView *imgView;

@end


@implementation SettingTableViewCell



#pragma mark - switchView懒加载:
-(UISwitch *)switchView
{
    
    if (_switchView == nil) {
        
        _switchView = [[UISwitch alloc] init];
        
    }
    return _switchView;
}

#pragma mark - imgView懒加载:
-(UIImageView *)imgView
{
    
    if (_imgView == nil) {
        
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
        
    }
    return _imgView;
}

#pragma mark - model的setter方法:
-(void)setModel:(SettingModel *)model
{
    
    _model = model;
  
    // 设置数据
    [self settingData];
    
    // 设置单元格AccessoryType
    [self settingCellAccessoryType];
    
}
// 设置数据
-(void)settingData
{
    self.imageView.image = [UIImage imageNamed:_model.icon];
    self.textLabel.text = _model.title;
}

// 设置单元格AccessoryType
-(void)settingCellAccessoryType
{
    if ( [_model isKindOfClass:[SettingModelArray class]] || [_model isKindOfClass:[SettingModelProduct class]] ) { // 箭头
        
        self.accessoryView = self.imgView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    } else if ([_model isKindOfClass:[SettingModelSwitch class]]) {
        
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
        
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }

}



#pragma mark - 初始化cell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    NSString *ID = @"cell";
    
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        
        cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    
    return cell;
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
