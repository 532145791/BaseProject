//
//  HttpTool.m
//  ProjectXmall
//
//  Created by zhihong meng on 2017/5/27.
//  Copyright © 2017年 yao liu. All rights reserved.
//

#import "HttpTool.h"
#import <AFNetworking.h>
#import "TMDRequestSerializer.h"
static AFHTTPSessionManager *manager;
static NSTimeInterval kTimeoutInterval = 30;
@implementation HttpTool

+ (AFHTTPSessionManager *)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [TMDRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = kTimeoutInterval;
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        ((AFJSONResponseSerializer *)manager.responseSerializer).removesKeysWithNullValues = YES;
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [manager.requestSerializer setValue:[CommonTool displayName] forHTTPHeaderField:@"app"];
        [manager.requestSerializer setValue:@"appstore" forHTTPHeaderField:@"channel"];
        [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@.%@",[CommonTool appVersion],[CommonTool appBuild]] forHTTPHeaderField:@"version"];
        [manager.requestSerializer setValue:[CommonTool systemVersion] forHTTPHeaderField:@"os"];
        [manager.requestSerializer setValue:[CommonTool deviceName] forHTTPHeaderField:@"device"];
        [manager.requestSerializer setValue:[CommonTool timeZone] forHTTPHeaderField:@"timezone"];
        [manager.requestSerializer setValue:[CommonTool country] forHTTPHeaderField:@"country"];
        [manager.requestSerializer setValue:[CommonTool language] forHTTPHeaderField:@"language"];
        [manager.requestSerializer setValue:[NSString stringWithFormat:@"X-%@",[CommonTool displayName]] forHTTPHeaderField:@"User-Agent"];
        [manager.requestSerializer setValue:[CommonTool uuid] forHTTPHeaderField:@"session-id"];
        
        //设置证书模式
        if ([BaseUrl hasPrefix:@"https"]) {
            NSString* cerPath = [[NSBundle mainBundle] pathForResource:@"app_innersect_api" ofType:@"cer"];
            NSData* cerData = [NSData dataWithContentsOfFile:cerPath];
            AFSecurityPolicy* securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[[NSSet alloc] initWithObjects:cerData, nil]];
            [securityPolicy setAllowInvalidCertificates:YES];
            [securityPolicy setValidatesDomainName:NO];
            manager.securityPolicy = securityPolicy;
        }
        
        [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
                [manager.requestSerializer setValue:@"WIFI" forHTTPHeaderField:@"network"];
            } else if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
                [manager.requestSerializer setValue:[CommonTool networkType] forHTTPHeaderField:@"network"];
            } else if (status == AFNetworkReachabilityStatusNotReachable) {
                [manager.requestSerializer setValue:@"None" forHTTPHeaderField:@"network"];
            } else {
                [manager.requestSerializer setValue:@"Unkown" forHTTPHeaderField:@"network"];
            }
        }];
        [manager.reachabilityManager startMonitoring];
        
    });
    
    return manager;
}

+ (void)getWithUrl:(NSString *)url paras:(id )paras success:(void (^)(id))success failure:(void (^)(NSString *))failure{
    [[HttpTool shareManager] GET:url parameters:paras progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"url=%@ 请求回来的结果是%@",url,responseObject);
        if (success) {
            if ([responseObject[@"code"] integerValue] == 200) {
                success(responseObject);
            }else if ([responseObject[@"code"] integerValue] == 401){//登录失效
                [[NSNotificationCenter defaultCenter] postNotificationName:Logout object:nil];
                if (responseObject[@"msg"]) {
                    failure(responseObject[@"msg"]);
                }else{
                    failure(NoKnowError);
                }
            }
            else{
                if (responseObject[@"msg"]) {
                    failure(responseObject[@"msg"]);
                }else{
                    failure(NoKnowError);
                }
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"url=%@ 请求回来的结果是%@",url,error);
            failure(NoKnowError);
        }
    }];
}

+ (void)postWithUrl:(NSString *)url paras:(id )paras success:(void (^)(id))success failure:(void (^)(NSString *))failure{
    [[HttpTool shareManager] POST:url parameters:paras progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"url=%@ 请求回来的结果是%@",url,responseObject);
        if (success) {
            if ([responseObject[@"code"] integerValue] == 200) {
                success(responseObject);
            }else if ([responseObject[@"code"] integerValue] == 2315){//验证码已发送
                success(responseObject);
            }else if ([responseObject[@"code"] integerValue] == 401){//登录失效
                [[NSNotificationCenter defaultCenter] postNotificationName:Logout object:nil];
                if (responseObject[@"msg"]) {
                    failure(responseObject[@"msg"]);
                }else{
                    failure(NoKnowError);
                }
            }
            else{
                if (responseObject[@"msg"]) {
                    failure(responseObject[@"msg"]);
                }else{
                    failure(NoKnowError);
                }
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"url=%@ 请求回来的结果是%@",url,error);
            failure(NoKnowError);
        }
    }];
}

//表单请求
+ (void)postFormDataWithUrl:(NSString *)url paras:(id )paras success:(void (^)(id))success failure:(void (^)(NSString *))failure{
    
     [[HttpTool shareManager] POST:url parameters:paras constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
         
     } progress:^(NSProgress * _Nonnull uploadProgress) {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSLog(@"url=%@ 请求回来的结果是%@",url,responseObject);
         if (success) {
             if ([responseObject[@"code"] integerValue] == 200) {
                 success(responseObject);
             }else if ([responseObject[@"code"] integerValue] == 401){//登录失效
                 [[NSNotificationCenter defaultCenter] postNotificationName:Logout object:nil];
                 if (responseObject[@"msg"]) {
                     failure(responseObject[@"msg"]);
                 }else{
                     failure(NoKnowError);
                 }
             }else{
                 if (responseObject[@"msg"]) {
                     failure(responseObject[@"msg"]);
                 }else{
                     failure(NoKnowError);
                 }
             }
         }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         if (error) {
             NSLog(@"url=%@ 请求回来的结果是%@",url,error);
             failure(NoKnowError);
         }
     }];
        
}
@end
