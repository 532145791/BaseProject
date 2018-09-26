//
//  NSString+Extend.h
//  BaseProject
//
//  Created by super on 2018/9/26.
//  Copyright © 2018年 lengchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extend)

/**
 计算字符串的高度

 @param font 字体
 @param maxWidth 最大宽度
 @param string 字符串
 @return 最大高度
 */
+ (CGFloat)getHeightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth string:(NSString *)string;

/**
 计算字符串的宽度

 @param font 字体
 @param maxHeight 最大高度
 @param string 字符串
 @return 最大宽度
 */
+ (CGFloat)getWidthWithFont:(UIFont *)font maxHeight:(CGFloat)maxHeight string:(NSString *)string;
@end
