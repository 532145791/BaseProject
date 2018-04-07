//
//  UIView+Masonry.m
//  BaseProject
//
//  Created by super on 2018/4/3.
//  Copyright © 2018年 lengchao. All rights reserved.
//

#import "UIView+Masonry.h"

@implementation UIView (Masonry)

+(UIView *)getViewWithBgColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UIView *, MASConstraintMaker *))block{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithHexString:colorHex];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(view,make);
        }
    }];
    return view;
}

+(UIButton *)getButtonWithFontSize:(UIFont *)font textColorHex:(NSString *)colorHex backGroundColor2:(NSString *)color superView:(UIView *)superView masonrySet:(void (^)(UIButton *view,MASConstraintMaker *make))block
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = font;
    [btn setTitleColor:[UIColor colorWithHexString:colorHex] forState:UIControlStateNormal];
    if (color) {
        [btn setBackgroundColor:[UIColor colorWithHexString:colorHex]];
    }
    
    [superView addSubview:btn];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(btn,make);
        }
    }];
    
    return btn;
}

+(UIImageView *)getImageViewWithImageName:(NSString *)imageName superView:(UIView *)superView masonrySet:(void (^)(UIImageView *view,MASConstraintMaker *make))block
{
    UIImageView *imageView;
    if (!imageName || [imageName isEqualToString:@""]) {
        imageView = [[UIImageView alloc] init];
    } else {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    }
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(imageView,make);
        }
    }];
    
    return imageView;
}

+(UILabel *)getLabelWithFontSize:(UIFont *)font textColorHex:(NSString *)colorHex superView:(UIView *)superView masonrySet:(void (^)(UILabel *, MASConstraintMaker *))block{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = [UIColor colorWithHexString:colorHex];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(label,make);
        }
    }];
    return label;
}

+(UITextField *)getTextFieldWithFontSize:(UIFont *)font textColorHex:(NSString *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView masonrySet:(void (^)(UITextField *, MASConstraintMaker *))block{
    UITextField *textfield = [[UITextField alloc] init];
    textfield.font = font;
    textfield.textColor = [UIColor colorWithHexString:colorHex];
    textfield.placeholder = placeHolder;
    textfield.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:textfield];
    
    [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(textfield,make);
        }
    }];
    
    return textfield;
}
@end
