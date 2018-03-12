//
//  UserInfoManager.h
//  ProjectXmall
//
//  Created by 轩辕神赋 on 2017/4/21.
//  Copyright © 2017年 yao liu. All rights reserved.
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
