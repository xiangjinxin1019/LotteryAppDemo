//
//  MyLotteryViewController.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/2/29.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "MyLotteryViewController.h"
#import "SettingTableViewController.h"

@interface MyLotteryViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;  // 登录按钮

@end

@implementation MyLotteryViewController

- (IBAction)setting:(id)sender
{
    
    // 创建“设置”tableViewController
    SettingTableViewController *settingVC = [[SettingTableViewController alloc] init];
    
    // push
    [self.navigationController pushViewController:settingVC animated:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 拉伸按钮的背景图片
    UIImage *image = [UIImage imageNamed:@"RedButton"];
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    UIImage *pressedImage = [UIImage imageNamed:@"RedButtonPressed"];
    
    pressedImage = [pressedImage stretchableImageWithLeftCapWidth:pressedImage.size.width * 0.5 topCapHeight:pressedImage.size.height * 0.5];
    
    [self.loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    [self.loginBtn setBackgroundImage:pressedImage forState:UIControlStateHighlighted];
    
    // 设置按钮的文字颜色
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    
}


@end
