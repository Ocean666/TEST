//
//  Place.h
//  WhereAmI_test
//
//  Created by geshu on 16/5/21.
//  Copyright © 2016年 personage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Place : NSObject <MKAnnotation>
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;

@end
