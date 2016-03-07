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

#import "SettingModelLabel.h"


@interface SettingTableViewCell ()

@property (nonatomic, strong) UISwitch *switchView;

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic,strong) UILabel *labelView;

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


#pragma mark - labelView懒加载:
-(UILabel *)labelView
{
    
    if (_labelView == nil) {
        
        _labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
        
        _labelView.textColor = [UIColor redColor];
        
        _labelView.textAlignment = NSTextAlignmentRight;
        
    }
    
    return _labelView;
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
    
    if (_model.icon.length) {
        
        self.imageView.image = [UIImage imageNamed:_model.icon];
        
    }
    
    self.textLabel.text = _model.title;
}

// 设置单元格AccessoryType
-(void)settingCellAccessoryType
{
    if ( [_model isKindOfClass:[SettingModelArray class]] ) { // 箭头
        
        self.accessoryView = self.imgView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    } else if ([_model isKindOfClass:[SettingModelSwitch class]]) {
        
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if ([_model isKindOfClass:[SettingModelLabel class]]) {
        
        self.accessoryView = self.labelView;
        
        SettingModelLabel *labelModel = (SettingModelLabel *)_model;
        
        self.labelView.text = labelModel.text;
        
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
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
