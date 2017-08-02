//
//  TMDRequestSerializer.m
//  projectx
//
//  Created by yao liu on 01/12/2016.
//  Copyright © 2016 yao liu. All rights reserved.
//

#import "TMDRequestSerializer.h"
@implementation TMDRequestSerializer
#pragma mark - AFURLRequestSerialization

- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(id)parameters
                                        error:(NSError *__autoreleasing *)error
{
    NSParameterAssert(request);
    
    if ([self.HTTPMethodsEncodingParametersInURI containsObject:[[request HTTPMethod] uppercaseString]]) {
        NSMutableURLRequest *mutableRequest = (NSMutableURLRequest *)[super requestBySerializingRequest:request withParameters:parameters error:error];
        NSString *token = [CommonTool getToken];
        if (token.length > 0) {
            [mutableRequest setValue:token forHTTPHeaderField:@"session-token"];
        }
        
        [mutableRequest setValue:[self generateSignatureForRequest:request withParamsString:mutableRequest.URL.query] forHTTPHeaderField:@"X-Request-sign"];
        return mutableRequest;
    }
    
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    
    [self.HTTPRequestHeaders enumerateKeysAndObjectsUsingBlock:^(id field, id value, BOOL * __unused stop) {
        if (![request valueForHTTPHeaderField:field]) {
            [mutableRequest setValue:value forHTTPHeaderField:field];
        }
    }];
    
    NSString *token = [CommonTool getToken];
    if (token.length > 0) {
        [mutableRequest setValue:token forHTTPHeaderField:@"session-token"];
    }
    
    if (parameters) {
        if (![mutableRequest valueForHTTPHeaderField:@"Content-Type"]) {
            [mutableRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        }
        
        //[mutableRequest setValue:[self generateSignatureForRequest:request withParameters:parameters] forHTTPHeaderField:@"X-Request-sign"];
        NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:self.writingOptions error:error];
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"sign=%@",[self generateSignatureForRequest:request withJSONString:@""]);
        [mutableRequest setValue:[self generateSignatureForRequest:request withJSONString:jsonString] forHTTPHeaderField:@"X-Request-sign"];

        [mutableRequest setHTTPBody:data];
        
    } else {
        NSLog(@"sign=%@",[self generateSignatureForRequest:request withJSONString:@""]);
        [mutableRequest setValue:[self generateSignatureForRequest:request withJSONString:@""] forHTTPHeaderField:@"X-Request-sign"];
    }
    
    return mutableRequest;
}

//get
- (NSString *)generateSignatureForRequest:(NSURLRequest *)request withParamsString:(NSString *)string {
    NSString *token = [CommonTool getToken];
    NSString *secretKey = [CommonTool getSecret];
    NSString *url = string.length <= 0 ? request.URL.path : [NSString stringWithFormat:@"%@?%@", request.URL.path, string];
//    NSLog(@"get sign string = %@",url);
    NSString *sign = [MD5Tool MD5ForUpper32Bate:[MD5Tool MD5ForUpper32Bate:[NSString stringWithFormat:@"%@%@%@", token, secretKey, url]]];
//    NSLog(@"sign = %@",sign);
    return sign;
}
//post
- (NSString *)generateSignatureForRequest:(NSURLRequest *)request withJSONString:(NSString *)jsonString {
    NSString *token = [CommonTool getToken];
    NSString *secretKey = [CommonTool getSecret];
//    NSLog(@"post sign string = %@%@",request.URL.path,jsonString);
    NSString *sign = [MD5Tool MD5ForUpper32Bate:[MD5Tool MD5ForUpper32Bate:[NSString stringWithFormat:@"%@%@%@%@", token, secretKey, request.URL.path, jsonString]]];
//    NSLog(@"sign = %@",sign);
    return sign;
}


@end
