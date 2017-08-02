//
//  LocationTool.m
//  BaseProject
//
//  Created by 冷超 on 2017/8/1.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "LocationTool.h"
void (^callbackBlock)(CLPlacemark*);
@interface LocationTool ()
{
    CLLocationManager *locMgr;
}
@end

@implementation LocationTool
static LocationTool *_instance;
+ (instancetype)sharedTool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_instance) {
            _instance = [[self alloc]init];
        }
    });
    
    return _instance;
}

-(instancetype)init{
    if (self = [super init]) {
        if ([CLLocationManager locationServicesEnabled]) {
            NSLog(@"开始执行定位服务");
            locMgr = [[CLLocationManager alloc]init];
            //2.设置代理
            locMgr.delegate = self;
            //设置定位精度：最佳精度
            locMgr.desiredAccuracy = kCLLocationAccuracyBest;
            //设置距离过滤器为50米，表示每移动50米更新一次位置
            locMgr.distanceFilter = 50;
            // 注意:在iOS8中, 如果想要追踪用户的位置, 必须自己主动请求隐私权限
            if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
                // 主动请求权限
                [locMgr requestAlwaysAuthorization];
            }
        }else{
            NSLog(@"无法使用定位服务！！！");
        }
    }
    return self;
}

-(void)getLocation:(void (^)(CLPlacemark *))completion{
    callbackBlock = completion;
    //开始监听定位信息
    [locMgr startUpdatingLocation];
}

#pragma mark -- CLLocationManagerDelegate
//成功获取定位数据后将会激发该方法
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    // locations数组里边存放的是CLLocation对象，一个CLLocation对象就代表着一个位置
    for (CLLocation *newLocation in locations) {
        //位置反编码(根据当前的经纬度获取具体的位置信息)
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
            for (CLPlacemark *placeMark in placemarks) {
                NSLog(@"位置:%@", placeMark.name);
                NSLog(@"街道:%@", placeMark.thoroughfare);
                NSLog(@"子街道:%@", placeMark.subThoroughfare);
                NSLog(@"市:%@", placeMark.locality);
                NSLog(@"区\\县:%@", placeMark.subLocality);
                NSLog(@"行政区:%@", placeMark.administrativeArea);
                NSLog(@"国家:%@", placeMark.country);
                NSLog(@"当前经纬度：%f,%f",placeMark.location.coordinate.latitude,placeMark.location.coordinate.longitude);
                
                callbackBlock(placeMark);
            }
        }];
        
        //停止定位,定位是一个很耗能的功能，在不需要时应当停止定位
        [manager stopUpdatingLocation];
        locMgr.delegate = nil;
    }
}
//定位失败时激发的方法
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"定位失败：%@",error);
    [SVProgressHUD showMessageWithStatus:@"定位失败，请重试"];
    callbackBlock(nil);
    [manager stopUpdatingLocation];
    locMgr.delegate = nil;
}

@end
