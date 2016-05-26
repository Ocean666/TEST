//
//  LMBottomMenu.h
//  LMFrame
//
//  Created by geshu on 16/5/25.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LMBottomMenu;

typedef enum {
    kBottomMenuItemTypeMood,
    kBottomMenuItemTypePhoto,
    kBottomMenuItemTypeBlog
} BottomMenuItemType;

@protocol LMBottomMenuDelegate <NSObject>

@optional
-(void) bottomMenu:(LMBottomMenu *)bottomMenu type:(BottomMenuItemType)type;

@end

@interface LMBottomMenu : UIView
@property (nonatomic, weak) id<LMBottomMenuDelegate> delegate;
- (void)rotateToLandscape:(BOOL)isLandscape;
@end