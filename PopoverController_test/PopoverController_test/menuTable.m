//
//  menuTable.m
//  PopoverController_test
//
//  Created by geshu on 16/5/28.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "menuTable.h"

@interface menuTable ()

@end

@implementation menuTable

- (void)viewDidLoad {
    [super viewDidLoad];
    //方法2.设置在控制气UIPopoverCOntroller大小
    self.preferredContentSize = CGSizeMake(100, 44*3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    cell.textLabel.text = @"选项^";
    return  cell;
}


@end
