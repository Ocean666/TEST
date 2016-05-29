//
//  LMNavigationController.m
//  meituanLayout
//
//  Created by geshu on 16/5/28.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "LMNavigationController.h"

@interface LMNavigationController ()

@end

@implementation LMNavigationController

+ (void)initialize
{
    // 1.拿到NavigationBar
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 2.设置背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
