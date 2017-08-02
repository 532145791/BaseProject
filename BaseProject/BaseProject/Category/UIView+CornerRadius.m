//
//  UIView+CornerRadius.m
//  系统API生产二维码
//
//  Created by lengchao on 16/2/25.
//  Copyright © 2016年 lengchao. All rights reserved.
//

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)
- (void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}
- (CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}

- (void)setLayerBoderWidth:(CGFloat)layerBoderWidth{
    self.layer.borderWidth = layerBoderWidth;
}

- (void)setLayerBoderColer:(UIColor *)layerBoderColer{
    self.layer.borderColor = layerBoderColer.CGColor;
}
@end
