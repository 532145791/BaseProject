//
//  BaseViewController.h
//  BaseProject
//
//  Created by 冷超 on 2017/6/30.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 *
 *  描述:
 配置属性  需要在初始化时设置 如init方法中设置
 内容:
 confDic : @{
 kNav_Hidden:@(),    //是否隐藏导航条
 kNav_Title:@(),     //导航条title
 kNav_LeftButton:@(),  //导航条左按钮
 kNav_RightButton:@()  //导航条右按钮
 }
 */
@property (nonatomic , strong) NSDictionary *confDic;

/**
 *  判断用户是否已经登录
 */
- (BOOL)isLogin;

/**
 *  前往登录界面
 */
- (void)goLogin;
@end
