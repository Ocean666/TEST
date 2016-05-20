//
//  ZHParserManager.h
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHParserManager : NSObject
-(id)JsonParserWith:(NSData *)data;
@end
