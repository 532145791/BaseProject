//
//  UserInfoModel.m
//  ProjectXmall
//
//  Created by 轩辕神赋 on 2017/4/21.
//  Copyright © 2017年 yao liu. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self != nil) {
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
        self.countryCode = [aDecoder decodeObjectForKey:@"countryCode"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
    [aCoder encodeObject:self.countryCode forKey:@"countryCode"];
}

@end
