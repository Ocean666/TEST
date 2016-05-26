//
//  LMIconButton.m
//  LMFrame
//
//  Created by geshu on 16/5/25.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "LMIconButton.h"

@implementation LMIconButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"tabbar_photo"] forState:UIControlStateNormal];
        [self setTitle:@"L^_^M" forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)rotateToLandscape:(BOOL)isLandscape
{
    // 1.设置自身frame
    self.width = isLandscape ? kIconButtonLandscapeWidth : kIconButtonPortraitWH;
    self.height = isLandscape ? kIconButtonLandscapeHeight : kIconButtonLandscapeTitleH;
    self.x = (self.superview.width -self.width) * 0.5;
    self.y = kIconButtonY;
}

#pragma 设置button的图像文字
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.width == self.height) {//判断是竖屏
        return self.bounds;
    } else { //横屏
        CGFloat width = self.width;
        CGFloat height = self.width;
        CGFloat x = 0;
        CGFloat y = 0;
        return CGRectMake(x, y, width, height);
    }
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (self.width == self.height) {//判断是竖屏
        return CGRectMake(0, 0, -1, -1);
    } else { //横屏
        CGFloat width = self.width;
        CGFloat height = kIconButtonLandscapeHeight;
        CGFloat x = 0;
        CGFloat y = self.width;
        return CGRectMake(x, y, width, height);
    }
}
@end
