//
//  LMMoodViewController.m
//  LMFrame
//
//  Created by geshu on 16/5/26.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "LMMoodViewController.h"

@interface LMMoodViewController ()

@end

@implementation LMMoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title  = @"发表微博";
    //设置左右的barbuttonItem
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回"style:UIBarButtonItemStyleDone target:self action:@selector(exit)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表"style:UIBarButtonItemStyleDone target:self action:nil];
    
}

- (void)exit
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
