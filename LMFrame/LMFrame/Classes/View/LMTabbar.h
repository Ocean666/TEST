//
//  LMTabbar.h
//  LMFrame
//
//  Created by geshu on 16/5/25.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMTabbar;
@class TabbarBt;

@protocol TabbarDelegate <NSObject>

@optional
- (void)tabbar:(LMTabbar *)tabbar fromIndex:(NSInteger)from toIndex:(NSInteger)to;

@end



@interface LMTabbar : UIView
//@property (nonatomic, strong) TabbarBt *selectedItem;
@property (nonatomic, weak) id<TabbarDelegate> delegate;

- (void)rotateToLandscape:(BOOL)isLandscape;
// 让SelectItem变成不选中
- (void)unSelected;
@end


@interface TabbarBt : UIButton

@end