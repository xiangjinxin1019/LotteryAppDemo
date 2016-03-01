//
//  SettingModelArray.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/29.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "SettingModelArray.h"


@implementation SettingModelArray


+(instancetype)settingModelWithIcon:(NSString *)icon
                              title:(NSString *)title
                      destinationVC:(Class)destinationVC
{
    SettingModelArray *model = [super settingModelWithIcon:icon title:title];
    
    model.destinationVC = destinationVC;
    
    return model;
}

@end
