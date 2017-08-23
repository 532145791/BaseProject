//
//  CropImage.h
//  Daixiong(Seller)
//
//  Created by 冷超 on 2017/4/16.
//  Copyright © 2017年 上海墨侠网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CropImage : NSObject
#pragma mark - 根据宽高等比缩放原图
+(NSURL *)getImageUrlWithOriginalUrl:(NSString *)originalUrlString width:(CGFloat)width height:(CGFloat)height;
+(UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;
@end
