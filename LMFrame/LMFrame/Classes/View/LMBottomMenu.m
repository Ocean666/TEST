//
//  LMBottomMenu.m
//  LMFrame
//
//  Created by geshu on 16/5/25.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "LMBottomMenu.h"

@implementation LMBottomMenu

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupBottomMenuItemWithImageNmae:@"tabbar_mood" type:kBottomMenuItemTypeMood];
        [self setupBottomMenuItemWithImageNmae:@"tabbar_photo" type:kBottomMenuItemTypePhoto];
        [self setupBottomMenuItemWithImageNmae:@"tabbar_blog" type:kBottomMenuItemTypeBlog];
    }
    return self;
}

- (void)setupBottomMenuItemWithImageNmae:(NSString *)imageName type:(BottomMenuItemType)type
{
    UIButton *item = [[UIButton alloc] init];
    [item setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    item.tag = type;
    
    [self addSubview:item];
}

- (void)itemClick:(UIButton *)item
{
    if ([self.delegate respondsToSelector:@selector(bottomMenu:type:)]) {
        [self.delegate bottomMenu:self type:(int)item.tag];
    }
}

- (void)rotateToLandscape:(BOOL)isLandscape
{
    NSInteger subCount = self.subviews.count;
    // 1.设置自身frame
    self.width = self.superview.width;
    self.height = isLandscape ? kDockItemHeight : kDockItemHeight * subCount;
    self.y = self.superview.height - self.height;
    
    //子控件的frame
    for (int i = 0; i < subCount; i++) {
        UIButton *item = self.subviews[i];
        item.width = isLandscape ? self.width / subCount : self.width;
        item.height = kDockItemHeight;
        item.x = isLandscape ? item.width * i : 0;
        item.y = isLandscape ? 0 : item.height * i;
    }
}


@end
