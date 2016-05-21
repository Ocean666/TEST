//
//  ViewController.m
//  WhereAmI_test
//
//  Created by geshu on 16/5/19.
//  Copyright © 2016年 personage. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
//记录最后一次更新是从位置器接受位置，这样每当用户移动足够触发更新的一段距离，我们就能将最后移动添加到距离中
@property (strong, nonatomic) CLLocation *previousPoint;
@property (assign, nonatomic) CLLocationDistance totalMovementDistance;

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *horizontalAccuracyLabel;
@property (weak, nonatomic) IBOutlet UILabel *altitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *verticalAccuracyLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceTraveledLabel;
//@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    //设置精确度最佳
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //请求任意时间使用Core Location的权限
    [self.locationManager requestWhenInUseAuthorization];
    

}

#pragma mark - CLLocationDelegate Methods

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog(@"Authorization status changed to %d",status);
    switch (status) {
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.locationManager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusRestricted:
            
        case kCLAuthorizationStatusDenied:
            [self.locationManager stopUpdatingLocation];
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *errorType = error.code == kCLErrorDenied ? @"Access Denied" : [NSString stringWithFormat:@"Error %ld", (long)error.code, nil];;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Location Manager Error" message:errorType preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}



















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
