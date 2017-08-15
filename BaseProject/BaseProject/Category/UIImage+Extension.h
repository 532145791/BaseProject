//
//  UIImage+Extension.h
//  BaseProject
//
//  Created by NeverMore on 2017/8/15.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 根据颜色生成一张图片

 @param color 颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
