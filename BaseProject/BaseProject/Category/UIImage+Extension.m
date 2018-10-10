//
//  UIImage+Extension.m
//  BaseProject
//
//  Created by NeverMore on 2017/8/15.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "UIImage+Extension.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
@implementation UIImage (Extension)
#pragma mark - 创建纯色图片
+ (UIImage *)imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark - 创建渐变颜色图片
+ (UIImage *)gradientFromColors:(NSArray *)colors withFrame:(CGRect)frame
{
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(frame.size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    start = CGPointMake(0.0, 0.0);
    end = CGPointMake(frame.size.width, 0.0);
    CGContextDrawLinearGradient(context, gradient, start, end,kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - 截图
+ (UIImage *)snapshotImageWithSize:(CGSize)size view:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

#pragma mark - 裁剪图片
+ (UIImage *)clipWithImageRect:(CGRect)rect clipImage:(UIImage *)clipImage
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(clipImage.CGImage, rect);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, rect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

#pragma mark - 图片高斯虚化
+ (UIImage *)blurImageOriImage:(UIImage *)oriImage radius:(CGFloat)radius
{
    CIImage *ciimage = [[CIImage alloc] initWithImage:oriImage];
    CIFilter *blureFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blureFilter setValue:ciimage forKey:kCIInputImageKey];
    [blureFilter setValue:@(radius) forKey:@"inputRadius"];
    CIImage *outCiimage = [blureFilter valueForKey:kCIOutputImageKey];
    CIContext *contenxt = [CIContext contextWithOptions:nil] ;
    CGImageRef outcgimage = [contenxt createCGImage:outCiimage fromRect:[ciimage extent]];
    UIImage *blurimage = [UIImage imageWithCGImage:outcgimage];
    return blurimage;
}

/**
 *  根据图片名返回一张能够自由拉伸的图片 (从中间拉伸)
 */
+ (UIImage *)ms_resizableImage:(NSString *)imgName
{
    UIImage *image = [UIImage imageNamed:imgName];
    return [self ms_resizableImage:imgName capInsets:UIEdgeInsetsMake(image.size.height *.5f, image.size.width*.5f, image.size.height*.5f, image.size.width*.5f)];
}

+ (UIImage *)ms_resizableImage:(NSString *)imgName capInsets:(UIEdgeInsets)capInsets
{
    UIImage *image = [UIImage imageNamed:imgName];
    return [image resizableImageWithCapInsets:capInsets];
}

+ (UIImage *)ms_imageAlwaysShowOriginalImageWithImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    if ([image respondsToSelector:@selector(imageWithRenderingMode:)])
    {   //iOS 7.0+
        return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        return image;
    }
}

+ (UIImage*)ms_thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time {
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    NSParameterAssert(asset);
    AVAssetImageGenerator *assetImageGenerator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetImageGenerator.appliesPreferredTrackTransform = YES;
    assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGImageRef thumbnailImageRef = NULL;
    CFTimeInterval thumbnailImageTime = time;
    NSError *thumbnailImageGenerationError = nil;
    thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)actualTime:NULL error:&thumbnailImageGenerationError];
    
    if(!thumbnailImageRef)
        NSLog(@"thumbnailImageGenerationError %@",thumbnailImageGenerationError);
    
    UIImage*thumbnailImage = thumbnailImageRef ? [[UIImage alloc]initWithCGImage: thumbnailImageRef] : nil;
    
    return thumbnailImage;
}

// 获取屏幕截图
+ (UIImage *)ms_screenShot {
    // 1. 获取到窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 2. 开始上下文
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, YES, 0);
    
    // 3. 将 window 中的内容绘制输出到当前上下文
    [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:NO];
    
    // 4. 获取图片
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5. 关闭上下文
    UIGraphicsEndImageContext();
    
    return screenShot;
}

//根据宽高等比缩放原图
+(NSURL *)getImageUrlWithOriginalUrl:(NSString *)originalUrlString width:(CGFloat)width height:(CGFloat)height{
    NSURL *resultUrl = [NSURL URLWithString:@""];
    NSRange range = [originalUrlString rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        NSString *tmpStr = [NSString stringWithFormat:@"%@?imageView2/2/w/%f/h/%f",originalUrlString,width*3,height*3];
        resultUrl = [NSURL URLWithString:tmpStr];
    }else{
        NSString *tmpStr=[originalUrlString substringToIndex:range.location];
        [tmpStr stringByAppendingString:[NSString stringWithFormat:@"%@?imageView2/2/w/%f/h/%f",originalUrlString,width*3,height*3]];
        resultUrl = [NSURL URLWithString:tmpStr];
    }
    return resultUrl;
}
@end
