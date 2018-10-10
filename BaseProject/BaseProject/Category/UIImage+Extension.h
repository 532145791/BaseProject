//
//  UIImage+Extension.h
//  BaseProject
//
//  Created by NeverMore on 2017/8/15.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

//创建纯色图片
+ (UIImage *)imageFromColor:(UIColor *)color;

//创建渐变颜色图片
+ (UIImage *)gradientFromColors:(NSArray *)colors withFrame:(CGRect)frame;

//截图
+ (UIImage *)snapshotImageWithSize:(CGSize)size view:(UIView *)view;

//裁剪图片
+ (UIImage *)clipWithImageRect:(CGRect)rect clipImage:(UIImage *)clipImage;

//图片高斯虚化
+ (UIImage *)blurImageOriImage:(UIImage *)oriImage radius:(CGFloat)radius;

//根据图片名返回一张能够自由拉伸的图片 (从中间拉伸)
+ (UIImage *)ms_resizableImage:(NSString *)imgName;
+ (UIImage *)ms_resizableImage:(NSString *)imgName capInsets:(UIEdgeInsets)capInsets;

// 返回一张未被渲染的图片
+ (UIImage *)ms_imageAlwaysShowOriginalImageWithImageName:(NSString *)imageName;

// 获取视频某个时间的帧图片
+ (UIImage *)ms_thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;

//获取屏幕截图
+ (UIImage *)ms_screenShot;

//根据宽高等比缩放原图
+(NSURL *)getImageUrlWithOriginalUrl:(NSString *)originalUrlString width:(CGFloat)width height:(CGFloat)height;
@end
