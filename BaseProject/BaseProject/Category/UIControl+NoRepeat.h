//
//  UIControl+NoRepeat.h
//  test
//
//  Created by NeverMore on 2017/11/8.
//  Copyright © 2017年 lengchao. All rights reserved.
//

//---------------------------防重复点击--------------------------//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#define defaultInterval 0.5//默认时间间隔
@interface UIControl (NoRepeat)
@property(nonatomic,assign) NSTimeInterval timeInterval;//用这个给重复点击加间隔
@property(nonatomic,assign) BOOL isIgnoreEvent;//YES-不允许点击 NO-允许点击
@end
