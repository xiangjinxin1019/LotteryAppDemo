//
//  SettingGroupModel.h
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/29.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroupModel : NSObject

@property (nonatomic,copy) NSString *header;

@property (nonatomic,copy) NSString *footer;

@property (nonatomic,strong) NSArray *items;  // 每组里面的内容

@end
