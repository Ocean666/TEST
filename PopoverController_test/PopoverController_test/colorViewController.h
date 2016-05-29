//
//  colorViewController.h
//  PopoverController_test
//
//  Created by geshu on 16/5/28.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SelectColorBlock)(UIColor *color);

@interface colorViewController : UIViewController
/** 选择颜色的回调block */
@property (nonatomic, copy) SelectColorBlock selectColor;

@end
