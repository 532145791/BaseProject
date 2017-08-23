//
//  CropImage.m
//  Daixiong(Seller)
//
//  Created by 冷超 on 2017/4/16.
//  Copyright © 2017年 上海墨侠网络科技有限公司. All rights reserved.
//

#import "CropImage.h"
#import <Accelerate/Accelerate.h>
@implementation CropImage

#pragma mark - 根据宽高等比缩放原图
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

+(UIImageView *)addBlurEffectWithImgView:(UIImageView *)imgView{
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = imgView.frame;
    [imgView addSubview:effectview];
    return imgView;
}

//加模糊效果，image是图片，blur是模糊度
+(UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur{
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef img = image.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate( outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}
@end
