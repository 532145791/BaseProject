//
//  MSResultModel.h
//  MSTJGF
//
//  Created by super on 2018/9/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultModel : NSObject
@property (nonatomic , assign) NSInteger code;//状态码 200--成功 !200--失败
@property (nonatomic , copy) NSString *message;//返回的信息
@property (nonatomic , copy) id data;//数据
@end
