//
//  CommonTool.h
//  ProjectXmall
//
//  Created by 冷超 on 2017/6/6.
//  Copyright © 2017年 yao liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonTool : NSObject

/**
 获取当前手机网络类型
 */
+ (NSString *)networkType;

/**
 获取build版本号
 */
+ (NSString *)appBuild;

/**
 获取version版本号
 */
+ (NSString *)appVersion;

/**
 获取系统版本号
 */
+ (NSString *)systemVersion;

/**
 获取设备名称
 */
+ (NSString *)deviceName;
/**
 获取当前设备时区
 */
+ (NSString *)timeZone;
+ (NSString *)country;
+ (NSString *)language;
+ (NSString *)uuid;
+ (NSString *)displayName;
//判空
+(BOOL)isNull:(id)object;

/**
 获取当前控制器
 */
+ (UIViewController *)currentViewController;
@end
