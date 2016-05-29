//
//  colorViewController.m
//  PopoverController_test
//
//  Created by geshu on 16/5/28.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "colorViewController.h"
#import "UIImage+GetColor.h"

@interface colorViewController ()
@property (weak,nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation colorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.preferredContentSize = self.imageView.image.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1.获取点击点位置
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    //2.获取点击点的point的颜色
    UIColor *selectColor = [self.imageView.image pixelColorAtLocation:point];
    
    // 3.将颜色传递给主控制器
    if (self.selectColor) {
        self.selectColor(selectColor);
    }
}

@end
