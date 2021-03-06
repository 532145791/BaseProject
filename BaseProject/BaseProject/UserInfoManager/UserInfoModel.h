//
//  UserInfoModel.h
//  BaseProject
//
//  Created by 冷超 on 2017/6/30.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "BaseModel.h"

@interface UserInfoModel : BaseModel <NSCoding>

/**
 用户id
 */
@property(copy, nonatomic) NSString *uid;

/**
 昵称
 */
@property(copy, nonatomic) NSString *nickname;

/**
 头像
 */
@property(copy, nonatomic) NSString *avatar;

/**
 性别
 */
@property(copy, nonatomic) NSString *sex;
/**
 手机号
 */
@property(copy, nonatomic) NSString *mobile;
/**
 城市编号
 */
@property(copy, nonatomic) NSString *countryCode;

@end
