//
//  UIColor+Extend.h
//  BaseProject
//
//  Created by 冷超 on 2017/6/30.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extend)
/**
 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
 
 */
+ (UIColor *) colorWithHexString: (NSString *)color;

/**
 *  十六进制颜色:含alpha
 */
+ (UIColor *)colorWithHexString:(NSString *)hexColorString alpha:(float)alpha;
@end
