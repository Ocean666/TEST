//
//  GSWeatherViewController.m
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "GSWeatherViewController.h"
#import "GSHTTPRequestManager.h"
#import "GSParserManager.h"
#import "GSMainModel.h"
#import "GSWeatherModel.h"
#import "Publich.h"
#import "GSDateModel.h"
#import "GSIndexModel.h"
#import "GSDateTableViewCell.h"
#import "GSIndexDetailVCViewController.h"

@interface GSWeatherViewController ()
{
        NSMutableArray *indexArray;
        NSMutableArray *dateArray;
        NSMutableArray *mainArray;
        NSMutableArray *mutableArray;
}

@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@end

@implementation GSWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mutableArray = [[NSMutableArray alloc]init];
    GSHTTPRequestManager *httpRequest = [[GSHTTPRequestManager alloc]init];
    [httpRequest sendRWquestLocation:_recordStr];
    GSParserManager *parser = [[GSParserManager alloc]init];
    __block GSWeatherViewController *wVC = self;
    httpRequest.myBlock = ^(NSData *data)
    {
        NSDictionary *dict = [parser JsonParserWith:data];
        GSMainModel *mainModel = [[GSMainModel alloc]initWithDictionary:dict];
        if (![mainModel.status isEqualToString:@"success"]) {
            
//            UIAlertController *conteoller = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"抱歉，你输入的城市查询不到" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Phew" style:UIAlertActionStyleCancel handler:nil];
//            [conteoller addAction:cancelAction];
//            return ;
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请输入需要查询的地区!!!" preferredStyle:  UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }]];
            
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
        }
        //传值的时候注意Block的调用  要在调用之后创建表 然后才可以接受到数据
        indexArray = mainModel.indexArray;
        dateArray = mainModel.dateArray;
        mainArray = mainModel.mainArray;
        UITableView *myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, screen_width, screen_height) style:UITableViewStylePlain];
        
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.backgroundColor = [UIColor clearColor];
        myTableView.separatorStyle = UITableViewCellAccessoryNone;
        [wVC.view addSubview:myTableView];
        [myTableView registerNib:[UINib nibWithNibName:@"GSDateTableViewCell" bundle:nil] forCellReuseIdentifier:@"dateCell"];
        [wVC.view bringSubviewToFront:wVC.backBtn];
    };

    
}


#pragma mark UITableViewDelegate/UITableViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 180;
    }else{
        return 60;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else if (section == 1){
        return 1;
    }else{
        return dateArray.count - 1;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 0)];
    view.backgroundColor = [UIColor blackColor];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    if (indexPath.section == 0) {
        GSWeatherModel *weatherModel = mainArray[0];
        if (indexPath.row == 0) {
            cell.textLabel.text = weatherModel.currentCity;
            cell.textLabel.textColor = [UIColor orangeColor];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            
        }else if (indexPath.row == 1){
            NSString *string = [NSString stringWithFormat:@"pm25: %@",weatherModel.pm25];
            cell.textLabel.text = string;
            cell.textLabel.textColor = [UIColor cyanColor];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
        }else{
             GSDateModel *date = dateArray[0];
            cell.textLabel.text = date.date;
            cell.textLabel.textColor = [UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        for (int i = 0; i<6; i++) {
            GSIndexModel *model = indexArray[i];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(20+(130+20)*(i/3), 5+(50+5)*(i%3), 130, 50);
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 120, 25)];
            label.text = model.tipt;
            label.font = [UIFont systemFontOfSize:15];
            label.numberOfLines = 0;
            label.textColor = [UIColor redColor];
            [btn addSubview:label];
            
            UILabel *labelZs = [[UILabel alloc]initWithFrame:CGRectMake(10, 25, 120, 25)];
            labelZs.text = model.zs;
            labelZs.font = [UIFont systemFontOfSize:15];
            labelZs.numberOfLines = 0;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i +10;
            labelZs.textColor = [UIColor redColor];
            [btn addSubview:labelZs];
            btn.backgroundColor = [UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
            btn.alpha = 0.5;
            btn.layer.cornerRadius = 10;
            btn.clipsToBounds = YES;
            [cell.contentView addSubview:btn];
            [cell.contentView sendSubviewToBack:btn];
            
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        GSDateModel *date = dateArray[indexPath.row +1];
        GSDateTableViewCell *dateTVCell = [tableView dequeueReusableCellWithIdentifier:@"dateCell"];
        dateTVCell.weekLabel.text = date.date;
        dateTVCell.windLabel.text = date.wind;
        dateTVCell.temLabel.text = date.temperature;
        NSLog(@"%@",date.temperature);
        dateTVCell.dayImageView.image = [self getImageWithUrlString:date.dayPictureUrl];
        dateTVCell.nightImageView.image = [self getImageWithUrlString:date.nightPictureUrl];
        dateTVCell.backgroundColor = [UIColor clearColor];
        dateTVCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return dateTVCell;
    }
}

-(UIImage *)getImageWithUrlString:(NSString *)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

-(void)btnClick:(id)sender
{
    UIButton *button = (UIButton *)sender;
    GSIndexModel *indexModel = indexArray[button.tag -10];
    GSIndexDetailVCViewController *indexDetailVC = [[GSIndexDetailVCViewController alloc]init];
    indexDetailVC.string = indexModel.des;
    [self presentViewController:indexDetailVC animated:YES completion:nil];
}

- (IBAction)backBtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
