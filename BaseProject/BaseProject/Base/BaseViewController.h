//
//  BaseViewController.h
//  BaseProject
//
//  Created by 冷超 on 2017/6/30.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
//点击导航条左按钮触发的方法
-(void)touchLeftBtn;

//点击导航条右按钮触发的方法
-(void)touchRightBtn;

//导航条格式：返回按钮(自定义(图片)) ----  title ---- 右按钮（自定义(图片)）   -------用这个方法重写导航后 没法右滑返回 需要实现以下这个方法才能返回
-(void)setNavigationBar;

/**
 无返回按钮
 */
-(void)setNavigationWithTitle:(NSString *)title;

/**
 有返回按钮
 */
-(void)setNavigationShowBackBtnWithNavigationTitle:(NSString *)title;

/**
 右按钮是文字
 */
- (void)addRightBarButtonItemWithTitle:(NSString *)itemTitle action:(SEL)action;

/**
 右按钮是图片
 */
- (void)addRightBarButtonWithImage:(UIImage *)firstImage action:(SEL)action;

/**
 *  用于push vc 隐藏tabbar
 *
 *  @param vc       要push的vc
 *  @param animated 动画效果
 */
- (void)basePushViewController:(UIViewController*)vc animated:(BOOL)animated;

/**
 *  dimiss页面
 */
- (void)dismissVC;

/**
 *popToRoot页面
 */
- (void)popToRoot;

/**
 *返回任意一个页面
 */
- (void)popToViewControllerAtIndex:(NSInteger)index;

/**
 *  pop页面
 */
- (void)popVC;
@end
