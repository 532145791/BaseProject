//
//  SVProgressHUD+Extend.m
//  ProjectXmall
//
//  Created by 轩辕神赋 on 2017/4/21.
//  Copyright © 2017年 yao liu. All rights reserved.
//

#import "SVProgressHUD+Extend.h"

@implementation SVProgressHUD (Extend)

+ (void)showErrorWithStatus:(NSString *)status dismissAfter:(NSInteger)second {
    
  [SVProgressHUD showErrorWithStatus:status];
  [self handleOnMainQueueAfterSecond:second];

}

+ (void)showSuccessWithStatus:(NSString *)status dismissAfter:(NSInteger)second
{
    [SVProgressHUD showSuccessWithStatus:status];
    [self handleOnMainQueueAfterSecond:second];
}

+(void)showMessageWithStatus:(NSString *)status{
    [self showMessageWithStatus:status dismissAfter:DismissTime];
}

+(void)showMessageWithStatus:(NSString *)status dismissAfter:(NSInteger)second{
    [[LCProgressHUD sharedView] showHintMessageWithStatus:status dismissAfter:second];
}

+ (void)handleOnMainQueueAfterSecond:(NSInteger)second
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       [SVProgressHUD dismiss];
                   });
    
}

@end
