//
//  ClearCacheTool.h
//  ProjectXmall
//
//  Created by zhihong meng on 2017/5/15.
//  Copyright © 2017年 yao liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClearCacheTool : NSObject

+ (NSString *)getCacheSize;

+ (void)clearCacheCompletion:(void(^)(id json))success;

@end
