//
//  GSHTTPRequestManager.h
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSHTTPRequestManager : NSObject
{
    NSMutableData *mutableData;
}
@property(nonatomic,copy)void(^myBlock)(NSData *);
-(void)sendRWquestLocation:(NSString *)location;
@end
