//
//  UserDefaults.h
//  yuepeng
//
//  Created by Studio Johnny on 15/1/13.
//  Copyright (c) 2015年 cn.chono. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaults : NSObject
+(void)saveDataWithKey:(NSString*)key value:(id)value;
+(id)getDataWithKey:(NSString*)key;
+(void)removeWithKey:(NSString*)key;
+(void)saveDataWithMyID:(NSString*)key value:(id)value;
+(id)getDataWithMyID:(NSString*)key;
+(void)removeWithMyID:(NSString*)key;
+(void)synchronizeUserDefaults;
+(void)cleanCache;
@end
