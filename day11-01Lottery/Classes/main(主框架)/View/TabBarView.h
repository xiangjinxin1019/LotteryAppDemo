//
//  TabBarView.h
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/27.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBarView;

@protocol TabBarViewDelegate <NSObject>

-(void) TabBarView:(TabBarView *)tabBarView didSelectedBtn:(NSInteger)selectedIndex;

@end


@interface TabBarView : UIView


// 声明block
// block名：callBlock
// 参数：selectedIndex
// @property (nonatomic,copy) void(^callBlock)(NSInteger selectedIndex);


@property (nonatomic,weak) id<TabBarViewDelegate> delegate;


-(void) addBtnsWithImageName:(NSString *)imageName SelImageName:(NSString *)selImageName;

@end
