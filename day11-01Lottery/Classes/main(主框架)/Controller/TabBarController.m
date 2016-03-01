//
//  TabBarController.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/27.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "TabBarController.h"

#import "TabBarView.h"

@interface TabBarController () <TabBarViewDelegate>

@end

@implementation TabBarController


#pragma mark - viewDidLoad方法：
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    
    // 创建TabBarView对象
    TabBarView *tabBarView = [[TabBarView alloc]init];
    tabBarView.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabBarView];
    
    NSString *imageName = nil;
    NSString *selImageName = nil;
    // 根据自控制器的个数添加底部按钮
    for (int i = 0; i < self.childViewControllers.count; i++) {
        
        imageName = [NSString stringWithFormat:@"TabBar%d",i + 1];
        selImageName = [NSString stringWithFormat:@"TabBar%dSel",i + 1];
        
        // 添加按钮
        [tabBarView addBtnsWithImageName:imageName SelImageName:selImageName];
        
    }
    
    
    
    // 成为TabBarView的代理
    tabBarView.delegate = self;
    
    // block的实现
//    tabBarView.callBlock = ^(NSInteger selectedIndex){
//        
//                self.selectedIndex = selectedIndex;
//        
//    };
    

    

    
    
    
}


#pragma mark - 实现TabBarView的代理方法:
-(void)TabBarView:(TabBarView *)tabBarView didSelectedBtn:(NSInteger)selectedIndex
{
    
    self.selectedIndex = selectedIndex;
}


@end
