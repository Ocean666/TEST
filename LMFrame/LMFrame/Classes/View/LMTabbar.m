//
//  LMTabbar.m
//  LMFrame
//
//  Created by geshu on 16/5/25.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "LMTabbar.h"
const CGFloat kRatio = 0.4;

@interface LMTabbar ()
@property (nonatomic, weak) TabbarBt *selectedItem;

@end
@implementation LMTabbar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupTabbarItemWithImageName:@"tab_bar_feed_icon" title:@"全部动态"];
        [self setupTabbarItemWithImageName:@"tab_bar_passive_feed_icon" title:@"与我相关"];
        [self setupTabbarItemWithImageName:@"tab_bar_pic_wall_icon" title:@"照片墙"];
        [self setupTabbarItemWithImageName:@"tab_bar_e_album_icon" title:@"电子相框"];
        [self setupTabbarItemWithImageName:@"tab_bar_friend_icon" title:@"好友"];
        [self setupTabbarItemWithImageName:@"tab_bar_e_more_icon" title:@"更多"];
    }
    return self;
}

- (void)setupTabbarItemWithImageName:(NSString *)imageName title:(NSString *)title
{
    TabbarBt *item = [TabbarBt buttonWithType:UIButtonTypeCustom];
    [item setTitle:title forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    [item addTarget:self action:@selector(btClick:) forControlEvents:UIControlEventTouchDown];
    item.tag = self.subviews.count;
    [self addSubview:item];
}

- (void)btClick:(TabbarBt *)bt
{
    // 通知代理
    if([self.delegate respondsToSelector:@selector(tabbar:fromIndex:toIndex:)]) {
        [self.delegate tabbar:self fromIndex:self.selectedItem.tag toIndex:bt.tag];
    }
    
    self.selectedItem.selected = NO;
    self.selectedItem = bt;
    self.selectedItem.selected = YES;
    
}

- (void)rotateToLandscape:(BOOL)isLandscape
{
    NSInteger subCount = self.subviews.count;
    // 1.设置自身frame
    self.width = self.superview.width;
    self.height = kDockItemHeight * subCount;
    
    for (int i= 0; i<subCount; i++) {
        UIButton *bt = self.subviews[i];
        bt.width = self.superview.width;
        bt.height = kDockItemHeight;
        bt.y = bt.height * i;
    }
}

#pragma mark - 让SelectItem变成不选中
- (void)unSelected{
    self.selectedItem.selected = NO;
}

@end














@implementation TabbarBt

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.width == self.height) {//判断是竖屏
        return self.bounds;
    } else { //横屏
        CGFloat width = self.width * kRatio;
        CGFloat height = self.height;
        CGFloat x = 0;
        CGFloat y = 0;
        return CGRectMake(x, y, width, height);
    }
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (self.width == self.height) {//判断是竖屏
        return CGRectZero;
    } else { //横屏
        CGFloat width = self.width * (1 - kRatio);
        CGFloat height = self.height;
        CGFloat x = self.width * kRatio;
        CGFloat y = 0;
        return CGRectMake(x, y, width, height);
    }
}


@end














