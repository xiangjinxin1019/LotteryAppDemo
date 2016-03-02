//
//  ProductCell.h
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/3/2.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProductModel;

@interface ProductCell : UICollectionViewCell

@property (nonatomic,strong) ProductModel *proModel;  // 数据模型

@end
