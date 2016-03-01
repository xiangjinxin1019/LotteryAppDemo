//
//  SettingModelProduct.h
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/3/1.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "SettingModel.h"

@interface SettingModelProduct : SettingModel

@property (nonatomic,assign) Class destinationVC; // 跳转的目的控制器

+(instancetype)settingModelWithIcon:(NSString *)icon
                              title:(NSString *)title
                      destinationVC:(Class)destinationVC;

@end
