//
//  GSWeatherModel.h
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSWeatherModel : NSObject
@property(nonatomic,copy)NSString *currentCity;
@property(nonatomic,retain)NSMutableArray *indexArray;
@property(nonatomic,copy)NSString *pm25;
@property(nonatomic,retain)NSMutableArray *dateArray;

-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
