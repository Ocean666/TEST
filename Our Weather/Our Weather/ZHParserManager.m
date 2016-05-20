//
//  ZHParserManager.m
//  weatherForecast
//
//  Created by 撰谦·你我他 on 16/3/30.
//  Copyright © 2016年 zhangliuxian. All rights reserved.
//

#import "ZHParserManager.h"

@implementation ZHParserManager

-(id)JsonParserWith:(NSData *)data{
    NSError *error = nil;
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error )
    {
        NSLog(@"%@",error);
    }
}
@end
