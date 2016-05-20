//
//  ZHParserManager.h
//  weatherForecast
//
//  Created by 撰谦·你我他 on 16/3/30.
//  Copyright © 2016年 zhangliuxian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHParserManager : NSObject
-(id)JsonParserWith:(NSData *)data;
@end
