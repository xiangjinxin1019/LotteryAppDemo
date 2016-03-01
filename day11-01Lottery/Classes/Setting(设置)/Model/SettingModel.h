//
//  SettingModel.h
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/29.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingModel : NSObject

@property (nonatomic , copy) NSString *icon;

@property (nonatomic,copy) NSString *title;


+(instancetype) settingModelWithIcon:(NSString *)icon title:(NSString *)title;


@end
