//
//  titleButton.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/28.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "titleButton.h"

@implementation titleButton


-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:17]
                           };
    CGRect realRect = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    CGFloat titleW = realRect.size.width;
    CGFloat titleH = contentRect.size.height;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGFloat imageW = 16;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
