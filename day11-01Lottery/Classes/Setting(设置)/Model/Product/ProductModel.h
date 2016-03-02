//
//  ProductModel.h
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/3/2.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *ID;

@property (nonatomic,copy) NSString *url;

@property (nonatomic,copy) NSString *icon;

@property (nonatomic,copy) NSString *customUrl;


+(instancetype) ProductModelWithDictionary:(NSDictionary *)dict;

@end
