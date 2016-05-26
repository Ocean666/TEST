//
//  AllStatusViewController.m
//  LMFrame
//
//  Created by geshu on 16/5/26.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "AllStatusViewController.h"

@interface AllStatusViewController ()

@end

@implementation AllStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 2.设置titleView
    NSArray *items = @[@"button1", @"button2", @"button3", @"button4"];
    UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:items];
    //默认选中
    sc.selectedSegmentIndex = 0;
    //设置按钮颜色
    sc.tintColor = [UIColor lightGrayColor];
    //设置按钮文字的颜色
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    [sc setTitleTextAttributes:attributes forState:UIControlStateNormal];
    self.navigationItem.titleView = sc;
    
    // 3.监听UISegmentedControl的点击
    [sc addTarget:self action:@selector(scClick:) forControlEvents:UIControlEventValueChanged];
}

- (void)scClick:(UISegmentedControl *)sc
{
    NSLog(@"%ld", sc.selectedSegmentIndex);
}

@end
