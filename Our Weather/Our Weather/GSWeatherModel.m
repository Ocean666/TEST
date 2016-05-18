//
//  GSWeatherModel.m
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "GSWeatherModel.h"

@implementation GSWeatherModel
-(id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        self.currentCity = [dictionary objectForKey:@"currentCity"];
        self.pm25 = [dictionary objectForKey:@"pm25"];
        self.indexArray = [dictionary objectForKey:@"index"];
        self.dateArray = [dictionary objectForKey:@"weather_data"];
    }
    return self;
}
@end
