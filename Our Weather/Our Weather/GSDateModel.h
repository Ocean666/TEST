//
//  GSDateModel.h
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSDateModel : NSObject
@property(nonatomic,copy)NSString *date;
@property(nonatomic,copy)NSString *dayPictureUrl;
@property(nonatomic,copy)NSString *nightPictureUrl;
@property(nonatomic,copy)NSString *weather;
@property(nonatomic,copy)NSString *wind;
@property(nonatomic,copy)NSString *temperature;

-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
