//
//  UIViewController+Extension.h
//  BaseProject
//
//  Created by NeverMore on 2017/8/15.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

/**
 设置导航的背景颜色以及透明度

 @param color 颜色
 @param alpha 透明度
 */
- (void)setNavigationBarColor:(UIColor *)color alpha:(CGFloat)alpha;
@end
