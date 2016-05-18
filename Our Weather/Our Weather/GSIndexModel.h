//
//  GSIndexModel.h
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSIndexModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *tipt;
@property(nonatomic,copy)NSString *zs;
@property(nonatomic,copy)NSString *des;

-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
