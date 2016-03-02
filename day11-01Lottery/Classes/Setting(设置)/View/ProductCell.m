//
//  ProductCell.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/3/2.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "ProductCell.h"
#import "ProductModel.h"


@interface ProductCell ()

@property (weak, nonatomic) IBOutlet UIImageView *productImage;

@property (weak, nonatomic) IBOutlet UILabel *productLabel;

@end


@implementation ProductCell


#pragma mark - setter方法
-(void)setProModel:(ProductModel *)proModel
{
    _proModel = proModel;
    
    _productImage.image = [UIImage imageNamed:proModel.icon];
    _productLabel.text = proModel.title;
    
}


- (void)awakeFromNib {
    
    // 设置图片圆角
    _productImage.layer.cornerRadius = 10;
    _productImage.clipsToBounds = YES;
    
}

@end
