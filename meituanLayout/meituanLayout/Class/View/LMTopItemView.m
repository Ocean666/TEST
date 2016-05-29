//
//  LMTopView.m
//  meituanLayout
//
//  Created by geshu on 16/5/28.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "LMTopItemView.h"

@interface LMTopItemView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *subtitileLable;
@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@end

@implementation LMTopItemView

+ (instancetype)topItemView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"LMTopItemView" owner:nil options:nil] firstObject];
}

- (void)setTitle:(NSString *)title
{
     self.titleLable.text = title;
}

-(void)setSubtitle:(NSString *)subtitle
{
    self.subtitileLable.text = subtitle;
}

- (void)setIconButtonWithImage:(NSString *)image higgImage:(NSString *)highImage
{
    [self.iconButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [self.iconButton setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
}

- (void)addTarget:(id)target action:(SEL)action
{
    [self.iconButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.iconButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
@end
