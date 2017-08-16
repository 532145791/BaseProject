

#import "ClearCacheTool.h"

@implementation ClearCacheTool

+ (NSString *)getCacheSize {
    
    NSUInteger intg = [[SDImageCache sharedImageCache] getSize];
    NSString * currentVolum = [NSString stringWithFormat:@"%@",[self fileSizeWithInterge:intg]];
    return  currentVolum;
}

#pragma mark 清理缓存
+ (void)clearCacheCompletion:(void (^)(id json))success {
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        if (success) {
            success(@"finish");
        }
    }];
}

+ (NSString *)fileSizeWithInterge:(NSInteger)size{
    if (size<1024*1024) {//    小于1M
        CGFloat aFloat = size/(1024);
        return [NSString stringWithFormat:@"%.1fK",ceil(aFloat)];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024 * 1024);
        return [NSString stringWithFormat:@"%.1fM",ceil(aFloat)];
    }else{
        CGFloat aFloat = size/(1024*1024*1024);
        return [NSString stringWithFormat:@"%.1fG",aFloat];
    }
}


@end
