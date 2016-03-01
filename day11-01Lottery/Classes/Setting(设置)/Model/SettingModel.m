//
//  SettingModel.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/29.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "SettingModel.h"



@implementation SettingModel

+(instancetype)settingModelWithIcon:(NSString *)icon title:(NSString *)title
{
    
    SettingModel *model = [[self alloc] init];
    model.icon = icon;
    model.title = title;
    

    
    return model;
}

@end
