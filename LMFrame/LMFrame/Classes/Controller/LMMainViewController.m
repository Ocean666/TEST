//
//  LMMainViewController.m
//  LMFrame
//
//  Created by geshu on 16/5/24.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "LMMainViewController.h"
#import "LMDock.h"
#import "LMBottomMenu.h"
#import "LMMoodViewController.h"
#import "LMTabbar.h"
#import "AllStatusViewController.h"
#import "LMIconButton.h"

@interface LMMainViewController () <LMBottomMenuDelegate,TabbarDelegate>
@property (weak,nonatomic) LMDock *dock;
@property (weak,nonatomic) UIView *currentVIew;
//当前控制器的下标
@property (nonatomic, assign) NSInteger currentIndex;
//内容的View
@property (nonatomic, weak) UIView *contentView;

//@property (nonatomic, strong) NSMutableArray *
@end

@implementation LMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:55.0/255.0 green:55.0/255.0 blue:55.0/255.0 alpha:1.0];
    
    [self setupDock];
    //初始化控制器
    [self setupController];
    
    // 初始化内容的View
    [self setupContentView];
    
    //默认选中的控制器直接调用
    [self iconButtonClick];

}

/**
 *  初始化内容的View
 */
- (void)setupContentView
{
    UIView *contentView = [[UIView alloc] init];
    contentView.width = kContentViewWidth;
    contentView.height = self.view.height - 20;
    contentView.x = self.dock.width;
    contentView.y = 20;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:contentView];
    self.contentView = contentView;
}

/**
 *  抽出一个包装导航控制器的方法,并且将他加入到我们的ChildViewControllers里面
 */
- (void)packNav:(UIViewController *)vc
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)setupController{
    //利用UINavgationController保存控制器，如下
    /*
    UINavigationController *nav = [[UINavigationController alloc] init];
    UIViewController *vc1 = [[UIViewController alloc]init];
    [self addChildViewController:vc1];
    */
    AllStatusViewController *vc1 = [[AllStatusViewController alloc] init];
    [self packNav:vc1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor blackColor];
    [self packNav:vc2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor purpleColor];
    [self packNav:vc3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor orangeColor];
    [self packNav:vc4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.view.backgroundColor = [UIColor yellowColor];
    [self packNav:vc5];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.view.backgroundColor = [UIColor greenColor];
    [self packNav:vc6];
    
    UIViewController *vc7 = [[UIViewController alloc] init];
    vc7.title = @"个人中心";
    vc7.view.backgroundColor = [UIColor lightGrayColor];
    [self packNav:vc7];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupDock
{
    LMDock *dock = [[LMDock alloc] init];
    dock.height = self.view.height;
    self.dock =dock;
    self.dock.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    BOOL isLandscap = self.view.width = kLandscapeWidth;
//    dock.width = isLandscap ? kDockLandscapeWidth : kDockPortraitWidth;
    
    dock.backgroundColor = [UIColor redColor];
    [self.view addSubview:dock];
    [self.dock rotateToLandscape:isLandscap];
    
    //设置BottomMenu的代理
    self.dock.bottomMenu.delegate = self;
    self.dock.tabbar.delegate = self;
    
    [self.dock.iconButton addTarget:self action:@selector(iconButtonClick) forControlEvents:UIControlEventTouchDown];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    BOOL isLandScape = size.width ==1024;
        CGFloat duration = [coordinator transitionDuration];
    [UIView animateWithDuration:duration animations:^{
        self.dock.width = isLandScape ? kDockLandscapeWidth : kDockPortraitWidth;
   
        [self.dock rotateToLandscape:isLandScape ];
    }];

}

#pragma mark BottomMenu代理方法
-(void)bottomMenu:(LMBottomMenu *)bottomMenu type:(BottomMenuItemType)type
{
    switch (type) {
            
        case kBottomMenuItemTypeMood:
        {
            //此处定义局部变量家｛｝
            LMMoodViewController *moodVc = [[LMMoodViewController alloc] init];
            UINavigationController *moodNav = [[UINavigationController alloc]initWithRootViewController:moodVc];
            //设置呈现样式
            moodNav.modalPresentationStyle = UIModalPresentationFullScreen;
            //设置过渡样式
            moodNav.modalTransitionStyle = UIModalTransitionStylePartialCurl;
            [self presentViewController:moodNav animated:YES completion:nil];

        }
            NSLog(@"发表了心情");
            break;
            
        case kBottomMenuItemTypePhoto:
            NSLog(@"点击了发表照片");
            break;
            
        case kBottomMenuItemTypeBlog:
            NSLog(@"点击了发表日志");
            break;
            
        default:
            break;
    }
}

#pragma mark - 实现tabbar的代理方法
- (void)tabbar:(LMTabbar *)tabbar fromIndex:(NSInteger)from toIndex:(NSInteger)to
{
    NSLog(@"from:%ld to: %ld",from,to);
    
    //1.取出久的控制器并移除
    UIViewController *oldVc = self.childViewControllers[from];
    //注，这里移除的是view不是viewController
    [oldVc.view removeFromSuperview];
    
    // 2.取出新的控制器的View,添加到self.view(控制器的View的autoresizing属性,默认情况是宽度和高度随着父控件拉伸而拉伸)
    UIViewController *newVc = self.childViewControllers[to];
    newVc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:newVc.view];
    
    self.currentIndex = to;
}

#pragma mark - 监听IconButton的点击
- (void)iconButtonClick
{
    [self tabbar:nil fromIndex:self.currentIndex toIndex:self.childViewControllers.count-1];
    [self.dock.tabbar unSelected];
}











@end
