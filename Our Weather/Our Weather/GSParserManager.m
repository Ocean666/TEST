//
//  ZHParserManager.h
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "GSParserManager.h"

@implementation GSParserManager : NSObject 

-(id)JsonParserWith:(NSData *)data{
    NSError *error = nil;
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error )
    {
        NSLog(@"%@",error);
    }
}
@end
