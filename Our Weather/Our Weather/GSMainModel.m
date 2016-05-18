//
//  GSMainModel.m
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "GSMainModel.h"
#import "GSWeatherModel.h"
#import "GSIndexModel.h"
#import "GSDateModel.h"

@implementation GSMainModel

-(id)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.error = [dic objectForKey:@"error"];
        self.status = [dic objectForKey:@"status"];
        self.date = [dic objectForKey:@"date"];
        self.resultsArray = [dic objectForKey:@"results"];
        [self.mainArray removeAllObjects];
        self.mainArray = [[NSMutableArray alloc]init];
        NSDictionary *dictionary = self.resultsArray[0];
        GSWeatherModel *weatherModel = [[GSWeatherModel alloc]initWithDictionary:dictionary];
        [self.mainArray addObject:weatherModel];
        
        self.indexArray = [[NSMutableArray alloc]init];
        [self.indexArray removeAllObjects];
        for (NSDictionary *indexDic in weatherModel.indexArray) {
            GSIndexModel *indexModel = [[GSIndexModel alloc]initWithDictionary:indexDic];
            [self.indexArray addObject:indexModel];
        }
        self.dateArray = [[NSMutableArray alloc] init];
        [self.dateArray removeAllObjects];
        for (NSDictionary *dateDic in weatherModel.dateArray) {
            GSDateModel *dateModel = [[GSDateModel alloc]initWithDictionary:dateDic];
            [self.dateArray addObject:dateModel];
        }
    }
    return self;
}
@end
