//
//  ViewController.m
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "ViewController.h"
#import "GSWeatherViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *locationTF;


@end

@implementation ViewController
- (IBAction)queryClick:(UIButton *)sender {
    if ([self.locationTF.text isEqualToString:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请输入需要查询的地区!!!" preferredStyle:  UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        
        //弹出提示框；
        [self presentViewController:alert animated:true completion:nil];
    }
    
    GSWeatherViewController *vc = [[GSWeatherViewController alloc]init];
    vc.recordStr = self.locationTF.text;
    [self presentViewController:vc animated:YES completion:nil];
    self.locationTF.text = @"";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
