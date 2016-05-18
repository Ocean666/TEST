//
//  GSDateTableViewCell.h
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSDateTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dayImageView;
@property (weak, nonatomic) IBOutlet UIImageView *nightImageView;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *temLabel;
@end
