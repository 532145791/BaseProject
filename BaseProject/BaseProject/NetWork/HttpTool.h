//
//  HttpTool.h
//  ProjectXmall
//
//  Created by zhihong meng on 2017/5/27.
//  Copyright © 2017年 yao liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject
/**
 get请求
 */
+ (void)getWithUrl:(NSString *)url paras:(id )paras success:(void(^)(id result))success failure:(void(^)(NSString *error))failure;

/**
 post请求
 */
+ (void)postWithUrl:(NSString *)url paras:(id )paras success:(void(^)(id result))success failure:(void(^)(NSString *error))failure;

/**
 post 表单请求
 */
+ (void)postFormDataWithUrl:(NSString *)url paras:(id )paras success:(void (^)(id result))success failure:(void (^)(NSString *error))failure;

@end
