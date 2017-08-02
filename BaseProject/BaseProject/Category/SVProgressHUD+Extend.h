//
//  SVProgressHUD+Extend.h
//  ProjectXmall
//
//  Created by 轩辕神赋 on 2017/4/21.
//  Copyright © 2017年 yao liu. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>
#import "LCProgressHUD.h"
@interface SVProgressHUD (Extend)


/**
 显示成功

 @param status 成功的标题
 @param second 几秒后隐藏
 */
+ (void)showSuccessWithStatus:(NSString *)status dismissAfter:(NSInteger)second;

/**
 显示错误
 
 @param status 错误的标题
 @param second 几秒后隐藏
 */
+ (void)showErrorWithStatus:(NSString *)status dismissAfter:(NSInteger)second;

/**
 信息提示
 
 @param status 标题
 @param second 几秒后隐藏
 */
+ (void)showMessageWithStatus:(NSString *)status dismissAfter:(NSInteger)second;

/**
 信息提示（动画时间固定）
 
 @param status 标题
 */
+ (void)showMessageWithStatus:(NSString *)status;
@end
