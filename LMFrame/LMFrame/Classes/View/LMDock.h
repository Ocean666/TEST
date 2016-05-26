//
//  LMDock.h
//  LMFrame
//
//  Created by geshu on 16/5/24.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMBottomMenu.h"
#import "LMTabbar.h"
#import "LMIconButton.h"

@interface LMDock : UIView
- (void)rotateToLandscape:(BOOL)isLandscape;
@property (nonatomic, weak, readonly) LMBottomMenu *bottomMenu;
@property (nonatomic, weak, readonly) LMTabbar *tabbar;
@property (nonatomic, weak, readonly) LMIconButton *iconButton;
@end
