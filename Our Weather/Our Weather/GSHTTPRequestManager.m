//
//  GSHTTPRequestManager.m
//  Our Weather
//
//  Created by geshu on 16/5/18.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "GSHTTPRequestManager.h"

@implementation GSHTTPRequestManager

-(void)sendRWquestLocation:(NSString *)location{
    
    mutableData = [[NSMutableData alloc]init];
    NSString *urlStr = [NSString stringWithFormat:@"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&ak=OnMGDYzjfKFPzurnK9o4ui2a",location];
//    NSString *newStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *newStr2 = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:newStr2];
     // 1.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
        
   
    
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [mutableData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    _myBlock(mutableData);
    
}
@end
