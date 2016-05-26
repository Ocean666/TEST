//
//  LMDock.m
//  LMFrame
//
//  Created by geshu on 16/5/24.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "LMDock.h"
#import "LMBottomMenu.h"
#import "LMTabbar.h"
#import "LMIconButton.h"

@interface LMDock ()

@end

@implementation LMDock

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupBottomMenu];
        [self setupTabbar];
        [self setupIconBUtton];
    }
    return  self;
}


#pragma  mark - 确定屏幕方向
- (void)rotateToLandscape:(BOOL)isLandscape
{
    //Dock设置宽度
    self.width = isLandscape ? kDockLandscapeWidth : kDockPortraitWidth;
     //设置bottoMenu的frame
    [self.bottomMenu rotateToLandscape:isLandscape];
    //设置tabbar
    [self.tabbar rotateToLandscape:isLandscape];
    self.tabbar.y = self.height - self.tabbar.height - self.bottomMenu.height;
    //设置iconButton的frame
    [self.iconButton rotateToLandscape:isLandscape];
    //
}

- (void)setupTabbar
{
    LMTabbar *tabbar = [[LMTabbar alloc]init];
    tabbar.backgroundColor  = [UIColor brownColor];
    //从底部开始拉伸
    tabbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:tabbar];
    _tabbar =tabbar;
}

- (void) setupBottomMenu
{
    LMBottomMenu *bottomMenu = [[LMBottomMenu alloc]init];
    bottomMenu.backgroundColor = [UIColor purpleColor];
    //设置在底部拉伸
    bottomMenu.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:bottomMenu];
    _bottomMenu = bottomMenu;
}

- (void)setupIconBUtton
{
    LMIconButton *iconButton = [[LMIconButton alloc] init];
    iconButton.backgroundColor = [UIColor orangeColor];
    [self addSubview:iconButton];
    _iconButton =iconButton;
}








@end
