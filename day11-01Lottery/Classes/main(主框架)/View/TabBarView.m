//
//  TabBarView.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/27.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "TabBarView.h"

#import "TabBarButton.h"


@interface TabBarView ()

@property (nonatomic,weak) UIButton *selectedBtn;  // 记录被选中的按钮

@end


@implementation TabBarView



#pragma mark - 添加按钮的方法:
-(void) addBtnsWithImageName:(NSString *)imageName SelImageName:(NSString *)selImageName
{
    
    TabBarButton *btn = [TabBarButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    // 设置按钮的selected状态时，需要添加监听方法，手动管理按钮被选中时的状态
    [btn setBackgroundImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];


}

-(void)btnSelected:(UIButton *)btn
{
    self.selectedBtn.selected = NO; //上一次被选中的按钮的选中状态 == NO
    
    btn.selected = YES;  // 当前被选中按钮的选中状态 == YES
    
    self.selectedBtn = btn; // 记录当前被选中的按钮R
    
    
    // 按钮被选中时，切换控制器
//    if (self.callBlock) {
//        
//        self.callBlock(btn.tag);
//    }
    
    
    // 调用代理方法
    if ( [self.delegate respondsToSelector:@selector(TabBarView:didSelectedBtn:)] ) {
        
        [self.delegate TabBarView:self didSelectedBtn:btn.tag];
        
    }
    
}

#pragma mark - 在layoutSubviews方法中设置按钮的frame
-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    
    for (int i = 0; i < self.subviews.count; i++) { // 遍历所有子，设置frame
        
        UIButton *btn = self.subviews[i];
        btn.tag = i;
        if (i == 0) { // 默认第一个按钮被选中
            
            [self btnSelected:btn];
            
        }
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
    }
    
}

@end
