//
//  TMDResponseSerializer.m
//  projectx
//
//  Created by yao liu on 23/12/2016.
//  Copyright © 2016 yao liu. All rights reserved.
//

#import "TMDResponseSerializer.h"

@implementation TMDResponseSerializer
- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    id responseToReturn = [super responseObjectForResponse:response data:data error:error];
    if (*error) {
        return responseToReturn;
    }
    
    NSError *parsingError;
    NSDictionary *JSONResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:&parsingError];
    
    if (parsingError) {
        (*error) = parsingError;
    }
    
    // Populate the error's userInfo using the parsed JSON
    NSMutableDictionary *userInfo = [(*error).userInfo mutableCopy];
    NSString *errorDescription = JSONResponse[@"error"];
    userInfo[NSLocalizedDescriptionKey] = errorDescription;
    
    NSError *annotatedError = [NSError errorWithDomain:(*error).domain
                                                  code:(*error).code
                                              userInfo:userInfo];
    (*error) = annotatedError;

    
    return responseToReturn;
}
@end
