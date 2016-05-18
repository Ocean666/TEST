//
//  GSDateModel.m
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "GSDateModel.h"

@implementation GSDateModel
-(id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        self.date = [dictionary objectForKey:@"date"];
        self.dayPictureUrl = [dictionary objectForKey:@"dayPictureUrl"];
        self.nightPictureUrl = [dictionary objectForKey:@"nightPictureUrl"];
        self.weather = [dictionary objectForKey:@"weather"];
        self.wind = [dictionary objectForKey:@"wind"];
        self.temperature = [dictionary objectForKey:@"temperature"];
    }
    return self;
}


@end
