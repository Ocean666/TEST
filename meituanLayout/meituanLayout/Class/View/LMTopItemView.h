//
//  LMTopView.h
//  meituanLayout
//
//  Created by geshu on 16/5/28.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMTopItemView : UIView
- (void)setTitle:(NSString *)title;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setIconButtonWithImage:(NSString *)image higgImage:(NSString *) highImage;
- (void)addTarget:(id)target action:(SEL)action;

+ (instancetype)topItemView;
@end
