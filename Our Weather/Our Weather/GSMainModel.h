//
//  GSMainModel.h
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSMainModel : NSObject
@property(nonatomic,copy)NSString *error;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *date;
@property(nonatomic,retain)NSArray *resultsArray;
@property(nonatomic,retain)NSMutableArray *mainArray;
@property(nonatomic,retain)NSMutableArray *indexArray;
@property(nonatomic,retain)NSMutableArray *dateArray;

-(id)initWithDictionary:(NSDictionary *)dic;
@end
