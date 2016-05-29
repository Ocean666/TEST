//
//  ViewController.m
//  PopoverController_test
//
//  Created by geshu on 16/5/26.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "ViewController.h"
#import "menuTable.h"
#import "oneViewController.h"
#import "colorViewController.h"
#import "TestViewController.h"

@interface ViewController ()
/** 菜单的Popover */
@property (nonatomic, strong) UIPopoverController *menuPopover;
/** 控制器的Popover */
@property (nonatomic, strong) UIPopoverController *controllerPopover;
/** 选择颜色的Popover */
@property (nonatomic, strong) UIPopoverController *colorPopover;
/** iOS的测试Popover */
@property (nonatomic, strong) TestViewController *testVc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)menuClick:(UIBarButtonItem *)sender {
    //创建内容控制器
    menuTable *mnVc = [[menuTable alloc]init];
    
    //创建UIPopoverVCOntroller
//    UIPopoverController *menuPopover = [[UIPopoverController alloc]initWithContentViewController:mnVc];
    
    // 2.设置内容控制器
    // [menuPopover setContentViewController:menuVc];
    
//    UIPopoverPresentationController *mm = [[UIPopoverPresentationController alloc] initWithPresentedViewController:mnVc presentingViewController:nil];
    
    //方法1.设置尺寸
//    [menuPopover setPopoverContentSize:CGSizeMake(100, 44*3)];
    
    //设置显示位置
//    [menuPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    [self.menuPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

- (IBAction)controllerClick:(UIBarButtonItem *)sender {
    [self.controllerPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (IBAction)selectColor:(UIButton *)sender {
    [self.colorPopover presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (IBAction)popover:(UIButton *)sender {
    /**
    // 1.创建准备以Popover形式弹出的控制器
    TestViewController *testVc = [[TestViewController alloc] init];
    
    // 2.设置弹出样式
    testVc.modalPresentationStyle = UIModalPresentationPopover;
    
    // 3.设置在什么位置弹出
    testVc.popoverPresentationController.sourceView = sender;
    testVc.popoverPresentationController.sourceRect = sender.bounds;
    
    [self presentViewController:self.testVc animated:YES completion:nil];
     */
    
    self.testVc.popoverPresentationController.sourceView = sender;
    self.testVc.popoverPresentationController.sourceRect = sender.bounds;
    [self presentViewController:self.testVc animated:YES completion:nil];
}

#pragma mark - 懒加载代码
- (UIPopoverController *)menuPopover
{
    if (_menuPopover == nil) {
        // 1.创建内容控制器
        menuTable *menuVc = [[menuTable alloc] init];
        
        // 2.创建UIPopoverController,并且指定内容控制器
        self.menuPopover = [[UIPopoverController alloc] initWithContentViewController:menuVc];
        
        self.menuPopover.delegate = self;
    }
    return _menuPopover;
}

- (UIPopoverController *)controllerPopover
{
    if (_controllerPopover == nil) {
        // 1.创建内容控制器
        oneViewController *oneVc = [[oneViewController alloc] init];
        UINavigationController *oneNav = [[UINavigationController alloc] initWithRootViewController:oneVc];
        
        // 2.创建UIPopoverController,并且设置内容控制器
        _controllerPopover = [[UIPopoverController alloc] initWithContentViewController:oneNav];
    }
    return _controllerPopover;
}

- (UIPopoverController *)colorPopover
{
    if (_colorPopover == nil) {
        // 1.创建内容控制器
        colorViewController *colorVc = [[colorViewController alloc] init];
        
        // 2.创建UIPopoverController,并且指定内容控制器
        self.colorPopover = [[UIPopoverController alloc] initWithContentViewController:colorVc];
        
        __weak UIPopoverController *colorPover = _colorPopover;
        __weak UIView *weakView = self.view;
        colorVc.selectColor = ^(UIColor *color) {
            weakView.backgroundColor = color;
            [colorPover dismissPopoverAnimated:YES];
        };
    }
    return _colorPopover;
}

- (TestViewController *)testVc
{
    if (_testVc == nil) {
        // 1.创建控制器
        _testVc = [[TestViewController alloc] init];
        
        // 2.设置样式
        self.testVc.modalPresentationStyle = UIModalPresentationPopover;
    }
    
    return _testVc;
}







@end
