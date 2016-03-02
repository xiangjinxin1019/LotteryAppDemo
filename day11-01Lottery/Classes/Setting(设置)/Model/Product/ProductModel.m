//
//  ProductModel.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/3/2.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel


/**字典转模型*/
+(instancetype)ProductModelWithDictionary:(NSDictionary *)dict
{
    
    ProductModel *proModel = [[ProductModel alloc] init];
    
//    [proModel setValue:proModel.title forKey:@"title"];
//    [proModel setValue:proModel.ID forKey:@"id"];
//    [proModel setValue:proModel.url forKey:@"url"];
//    [proModel setValue:proModel.icon forKey:@"icon"];
//    [proModel setValue:proModel.customUrl forKey:@"customUrl"];
    
    proModel.title = dict[@"title"];
    proModel.ID = dict[@"id"];
    proModel.url = dict[@"url"];
    proModel.icon = dict[@"icon"];
    proModel.customUrl = dict[@"customUrl"];
    
    return proModel;
}


-(void)setIcon:(NSString *)icon
{
    
    _icon = [icon stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];
    
}

@end
