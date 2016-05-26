//
//  LoginViewController.m
//  LMFrame
//
//  Created by geshu on 16/5/24.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "LMLoginViewController.h"
#import "LMMainViewController.h"

@interface LMLoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UIButton *rememberPassWordBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoLoginBtn;



- (IBAction)login;

@end

@implementation LMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)login {
    //退出键盘
    [self.view endEditing:YES];
    
    NSString *account = self.accountField.text;
    NSString *password = self.passwordField.text;
    if (account.length == 0 || password == 0) {
        [self showError:@"账号密码不能为空" ];
        return;
    }
    
    [self.activityView startAnimating];
    CGFloat duration = 1.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([account isEqualToString:@"123"] && [password isEqualToString:@"123"]) {
            //self.view.window.rootViewController = [[LMMainViewController alloc] init];
            LMMainViewController *vc = [[LMMainViewController alloc] init];
            [self presentViewController:vc animated:YES completion:nil];
        } else {
            [self showError:@"账号或密码错误" ];
            [self.activityView stopAnimating];

        }
    });
}

- (void)showError:(NSString *)error
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败" message:error delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
    
    //给登录一个动画效果
    CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    shakeAnim.values = @[@-10,@0,@10,@0];
    shakeAnim.repeatCount = 5;
    //时间
    shakeAnim.duration = 0.15;
    [self.loginView.layer addAnimation:shakeAnim forKey:nil];
}

#pragma mark TextField代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.accountField) {
        [self.passwordField becomeFirstResponder];
    } else if(textField == self.passwordField){
        [self login];
    }
    return YES;
}

#pragma mark 记住密码和自动登录
- (IBAction)rememberPassword:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    if (sender.isSelected == NO) {
        self.autoLoginBtn.selected = NO;
    }
}
- (IBAction)autoLogin:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    if (sender.isSelected == YES) {
        self.rememberPassWordBtn.selected = YES;
    }
}
















@end
