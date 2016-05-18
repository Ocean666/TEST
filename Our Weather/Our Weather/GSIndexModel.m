//
//  GSIndexModel.m
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "GSIndexModel.h"

@implementation GSIndexModel
-(id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        self.title = [dictionary objectForKey:@"title"];
        self.tipt = [dictionary objectForKey:@"tipt"];
        self.zs = [dictionary objectForKey:@"zs"];
        self.des = [dictionary objectForKey:@"des"];
    }
    return self;
}
@end
