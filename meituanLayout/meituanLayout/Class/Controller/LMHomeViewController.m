//
//  LMHomeViewController.m
//  meituanLayout
//
//  Created by geshu on 16/5/28.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "LMHomeViewController.h"
#import "LMTopItemView.h"

@interface LMHomeViewController ()

@end

@implementation LMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 1.设置左侧的barButtonItems
    [self setupLeftBarButtonItems];
}

- (void)setupLeftBarButtonItems
{
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    //创建logo的Item
    UIBarButtonItem *logoItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    //按钮无法点击
    logoItem.enabled = NO;
    
    //创建分类的Item
    LMTopItemView *categoryItemView = [LMTopItemView topItemView];
    [categoryItemView setTitle:@"美团"];
    [categoryItemView setSubtitle:@"全部类别ooo"];
    [categoryItemView setIconButtonWithImage: @"icon_category_-1" higgImage:@"icon_category_highlighted_-1"];
    [categoryItemView addTarget:self action:@selector(categoryClick)];
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc] initWithCustomView:categoryItemView];
    
    //创建区域item
    LMTopItemView *regionItemView = [LMTopItemView topItemView];
    [regionItemView setTitle:@"广州"];
    [regionItemView setSubtitle:@"全部区域"];
    [regionItemView setIconButtonWithImage: @"icon_district-1" higgImage:@"icon_category_highlighted_-1"];
    [regionItemView addTarget:self action:@selector(regionClick)];
    UIBarButtonItem *regionItem = [[UIBarButtonItem alloc] initWithCustomView:regionItemView];
    
    //创建分类Item
    LMTopItemView *sortItemView = [LMTopItemView topItemView];
    [sortItemView setTitle:@"美团"];
    [sortItemView setSubtitle:@"全部类别"];
    [sortItemView setIconButtonWithImage: @"icon_category_-1" higgImage:@"icon_category_highlighted_-1"];
    [sortItemView addTarget:self action:@selector(sortClick)];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:sortItemView];
    
    
   
    //设置leftBarBUttonItems
    self.navigationItem.leftBarButtonItems = @[logoItem,categoryItem,regionItem,sortItem];
    
}

#pragma mark - 监听Items的点击
- (void)categoryClick
{
    //因为在导航条，所以用barButtonItem 设定 popoverPresentationController
//    self.categoryVc.popoverPresentationController.barButtonItem = self.categoryItem;
//    [self presentViewController:self.categoryVc animated:YES completion:nil];
}

- (void)regionClick
{
//    self.regionVc.popoverPresentationController.barButtonItem = self.regionItem;
//    [self presentViewController:self.regionVc animated:YES completion:nil];
}

- (void)sortClick
{
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
