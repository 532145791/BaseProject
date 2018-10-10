//
//  CommonTool.m
//  ProjectXmall
//
//  Created by 冷超 on 2017/6/6.
//  Copyright © 2017年 yao liu. All rights reserved.
//

#import "CommonTool.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
@implementation CommonTool
+ (NSString *)networkType {
    NSString *netconnType = @"";
    
    // 获取手机网络类型
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    NSString *currentStatus = info.currentRadioAccessTechnology;
    
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyGPRS"]) {
        
        netconnType = @"GPRS";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyEdge"]) {
        
        netconnType = @"2.75G EDGE";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyWCDMA"]){
        
        netconnType = @"3G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSDPA"]){
        
        netconnType = @"3.5G HSDPA";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSUPA"]){
        
        netconnType = @"3.5G HSUPA";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMA1x"]){
        
        netconnType = @"2G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORev0"]){
        
        netconnType = @"3G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevA"]){
        
        netconnType = @"3G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevB"]){
        
        netconnType = @"3G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyeHRPD"]){
        
        netconnType = @"HRPD";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyLTE"]){
        
        netconnType = @"4G";
    }
    
    return netconnType;
}


+ (NSString *)appBuild {
    return   [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
}

+ (NSString *)appVersion {
    return  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)systemVersion {
    return  [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)deviceName {
    return [[UIDevice currentDevice] systemName];
}

+ (NSString *)timeZone {
    return [NSTimeZone localTimeZone].name;
}

+ (NSString *)country {
    NSLocale *currentLocale = [NSLocale currentLocale];  // get the current locale.
    return  [currentLocale objectForKey:NSLocaleCountryCode];
}

+ (NSString *)language {
    return [[NSLocale preferredLanguages] objectAtIndex:0];
}

+ (NSString *)uuid {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+(NSString *)displayName{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"];
}

+(BOOL)isNull:(id)object{
    if(object==nil||object==[NSNull null]){
        return YES;
    }else if([object isKindOfClass:[NSString class]]){
        NSString *string=object;
        if ([string isEqual:@""]||string.length == 0) {
            return YES;
        }
    }else if([object isKindOfClass:[NSData class]]){
        NSData *data=object;
        if (data.length==0) {
            return YES;
        }
    }else if([object isKindOfClass:[NSDictionary class]]){
        NSDictionary *dictionary=object;
        if (dictionary.count==0) {
            return YES;
        }
    }else if([object isKindOfClass:[NSArray class]]){
        NSArray *array=object;
        if (array.count==0) {
            return YES;
        }
    }
    return NO;
}

+ (UIViewController *)topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

+ (UIViewController *)currentViewController
{
    UIViewController *currentViewController;
    currentViewController = [self topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (currentViewController.presentedViewController) {
        currentViewController = [self topViewController:currentViewController.presentedViewController];
    }
    return currentViewController;
}
@end
