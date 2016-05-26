//
//  LMMainViewController.m
//  LMFrame
//
//  Created by geshu on 16/5/24.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "LMMainViewController.h"
#import "LMDock.h"
#import "LMBottomMenu.h"
@interface LMMainViewController () <LMBottomMenuDelegate>
@property (weak,nonatomic) LMDock * dock;
@end

@implementation LMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:55.0/255.0 green:55.0/255.0 blue:55.0/255.0 alpha:1.0];
    
    [self setupDock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupDock
{
    LMDock *dock = [[LMDock alloc] init];
    dock.height = self.view.height;
    self.dock =dock;
    self.dock.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    BOOL isLandscap = self.view.width = kLandscapeWidth;
//    dock.width = isLandscap ? kDockLandscapeWidth : kDockPortraitWidth;
    
    dock.backgroundColor = [UIColor redColor];
    [self.view addSubview:dock];
    [self.dock rotateToLandscape:isLandscap];
    
    //设置BottomMenu的代理
    self.dock.bottomMenu.delegate = self;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    BOOL isLandScape = size.width ==1024;
        CGFloat duration = [coordinator transitionDuration];
    [UIView animateWithDuration:duration animations:^{
        self.dock.width = isLandScape ? kDockLandscapeWidth : kDockPortraitWidth;
   
        [self.dock rotateToLandscape:isLandScape ];
    }];

}

#pragma mark BottomMenu代理方法
-(void)bottomMenu:(LMBottomMenu *)bottomMenu type:(BottomMenuItemType)type
{
    switch (type) {
        case kBottomMenuItemTypeMood:

            NSLog(@"发表了心情");
            break;
            
        case kBottomMenuItemTypePhoto:
            NSLog(@"点击了发表照片");
            break;
            
        case kBottomMenuItemTypeBlog:
            NSLog(@"点击了发表日志");
            break;
            
        default:
            break;
    }
}














@end
