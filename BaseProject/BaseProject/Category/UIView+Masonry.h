//
//  UIView+Masonry.h
//  BaseProject
//
//  Created by super on 2018/4/3.
//  Copyright © 2018年 lengchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Masonry)

/**
 *  实例化一个UIView，省去每次都要写很多重复的代码
 *
 *  @param colorHex  颜色
 *  @param superView 父view
 *  @param block     lyt设置约束布局的代码
 *
 *  @return UILabel
 */
+(UIView *)getViewWithBgColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UIView *view,MASConstraintMaker *make))block;

/**
 *  获取一个button
 *
 *  @param font             title的font
 *  @param colorHex         title的色值
 *  @param color            背景色
 *  @param superView        父view
 *  @param block            lyt设置约束布局的代码
 *
 *  @return UIButton
 */
+(UIButton *)getButtonWithFontSize:(UIFont *)font textColorHex:(NSString *)colorHex backGroundColor2:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block;

/**
 *  实例化一个UIImageView
 *
 *  @param imageName 图片名
 *  @param superView 父view
 *  @param block     lyt设置约束布局的代码
 *
 *  @return UIImageView
 */
+(UIImageView *)getImageViewWithImageName:(NSString *)imageName superView:(UIView *)superView masonrySet:(void (^)(UIImageView *view,MASConstraintMaker *make))block;

/**
 *  实例化一个UILabel
 *
 *  @param font         fontsize
 *  @param colorHex     color
 *  @param superView    父view
 *  @param block        lyt设置约束布局的代码
 *
 *  @return UILabel
 */
+(UILabel *)getLabelWithFontSize:(UIFont *)font textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *view,MASConstraintMaker *make))block;


/**
 实例化一个UITextfield

 @param font 字体
 @param colorHex 字体颜色
 @param placeHolder 水印
 @param superView 父view
 @param block lyt设置约束布局的代码
 @return UITextfield
 */
+(UITextField *)getTextFieldWithFontSize:(UIFont *)font textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *view,MASConstraintMaker *make))block;
@end
