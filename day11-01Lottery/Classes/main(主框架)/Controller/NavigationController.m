//
//  NavigationController.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/28.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController


+(void)initialize
{
    
    if (self == [NavigationController class]) {
        
        // 设置导航条背景图片
        UINavigationBar *bar = [UINavigationBar appearance];
        [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        
        // 设置导航条文字颜色
        NSDictionary *dict = @{
                               NSForegroundColorAttributeName: [UIColor whiteColor]
                               
                               };
        [bar setTitleTextAttributes:dict];
        
        
        // 设置导航条“主题颜色”
        [bar setTintColor:[UIColor whiteColor]];
    }

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    viewController.hidesBottomBarWhenPushed = YES;
    
    return [super pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
