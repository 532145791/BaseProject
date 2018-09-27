//
//  UserInfoManager.h
//  BaseProject
//
//  Created by 冷超 on 2017/6/30.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"

@interface UserInfoManager : NSObject

/**
 保存用户信息
 @param model userModel
 */
+ (void)setUserInfo:(UserInfoModel *)model;

/**
 获取用户信息
 @return userModel
 */
+ (UserInfoModel *)getUserInfo;

/**
 删除用户
 */
+ (void)deleteUserInfo;

@end
