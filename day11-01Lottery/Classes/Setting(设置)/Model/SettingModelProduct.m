//
//  SettingModelProduct.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/3/1.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "SettingModelProduct.h"

@implementation SettingModelProduct

+(instancetype)settingModelWithIcon:(NSString *)icon
                              title:(NSString *)title
                      destinationVC:(Class)destinationVC
{
    SettingModelProduct *model = [super settingModelWithIcon:icon title:title];
    
    model.destinationVC = destinationVC;
    
    return model;
}

@end
