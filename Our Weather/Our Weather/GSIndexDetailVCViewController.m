//
//  GSIndexDetailVCViewController.m
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "GSIndexDetailVCViewController.h"
#import "Publich.h"

@interface GSIndexDetailVCViewController ()

@end

@implementation GSIndexDetailVCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, screen_width, screen_height-20)];
    label.text = _string;
    label.textColor = [UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    label.font = [UIFont systemFontOfSize:17];
    label.numberOfLines = 5;
    [self.view addSubview:label];
}
- (IBAction)clickBackBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
