//
//  UserDefaults.m
//  yuepeng
//
//  Created by Studio Johnny on 15/1/13.
//  Copyright (c) 2015年 cn.chono. All rights reserved.
//

#import "UserDefaults.h"

NSUserDefaults *userDefaults;
@implementation UserDefaults
+(void)saveDataWithKey:(NSString *)key value:(id)value{
    if ([CommonTool isNull:userDefaults]) {
        userDefaults=[[NSUserDefaults alloc]initWithSuiteName:[CommonTool displayName]];
    }
    NSMutableArray *keys=[userDefaults objectForKey:@"keys"];
    if ([CommonTool isNull:keys]) {
        keys=[NSMutableArray arrayWithObject:key];
    }else{
        keys=[NSMutableArray arrayWithArray:keys];
        if (![keys containsObject:key]) {
            [keys addObject:key];
        }
    }
    [userDefaults setObject:keys forKey:@"keys"];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

+(id)getDataWithKey:(NSString *)key{
    if ([CommonTool isNull:userDefaults]) {
        userDefaults=[[NSUserDefaults alloc]initWithSuiteName:[CommonTool displayName]];
    }
    return [userDefaults objectForKey:key];
}

+(void)removeWithKey:(NSString *)key{
    if ([CommonTool isNull:userDefaults]) {
        userDefaults=[[NSUserDefaults alloc]initWithSuiteName:[CommonTool displayName]];
    }
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

+(void)cleanCache{
    if ([CommonTool isNull:userDefaults]) {
        userDefaults=[[NSUserDefaults alloc]initWithSuiteName:[CommonTool displayName]];
    }
    NSMutableArray *keys=[NSMutableArray arrayWithArray:[UserDefaults getDataWithKey:@"keys"]];
    if (![keys isEqual:[NSNull null]]) {
        for (NSInteger i=0; i<keys.count; i++) {
            NSString *key=[keys objectAtIndex:i];
            [keys removeObject:key];
            [userDefaults removeObjectForKey:key];
            i--;
        }
        [userDefaults setObject:keys forKey:@"keys"];
    }
    [userDefaults synchronize];
}
@end
