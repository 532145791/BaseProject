
//-------------------网络请求管理类---------------------//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "ResultModel.h"
extern NSString *const RACAFNResponseObjectErrorKey;

@interface HttpTool : NSObject
/**
 get请求
 */
+ (void)getWithUrl:(NSString *)url paras:(id )paras success:(void(^)(ResultModel *result))success failure:(void(^)(NSError *error))failure;

/**
 post请求
 */
+ (void)postWithUrl:(NSString *)url paras:(id )paras success:(void(^)(ResultModel *result))success failure:(void(^)(NSError *error))failure;
@end
