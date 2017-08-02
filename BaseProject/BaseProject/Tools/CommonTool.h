//
//  CommonTool.h
//  ProjectXmall
//
//  Created by 冷超 on 2017/6/6.
//  Copyright © 2017年 yao liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonTool : NSObject
+ (NSString *)networkType;
+ (NSString *)appBuild;
+ (NSString *)appVersion;
+ (NSString *)systemVersion;
+ (NSString *)deviceName;
+ (NSString *)timeZone;
+ (NSString *)country;
+ (NSString *)language;
+ (NSString *)uuid;
+ (NSString *)displayName;
+ (NSString *)getToken;
+ (NSString *)getSecret;
+ (void)clearTokenSecret;
+ (void)updateAccessToken:(NSString *)token;
+ (void)updateSecretkey:(NSString *)secretKey;
//判空
+(BOOL)isNull:(id)object;
//计算字符串的高度
+ (float)heightForView:(UIView *)view andWidth:(float)width;

@end
