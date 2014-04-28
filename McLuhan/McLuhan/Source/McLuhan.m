//
//  McLuhan.m
//  McLuhan
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "McLuhan.h"
#import <UIKit/UIKit.h>


NSString *const kMcLuhanErrorDomain = @"mcluhan.error";
NSInteger const kCantOpenURL        = 1000;
NSInteger const kErrorOpeningURL    = 1100;
NSString *const kMcLuhanErrorURLKey = @"mcluhan.error.url";

NSString *const kXCallbackUrl   = @"x-callback-url";

NSString *const kDidOpenUrlNotificationName = @"mcluhan.did.open.url";
NSString *const kMcLuhanUrlActionKey    = @"mcluhan.url.action";
NSString *const kMcLuhanUrlParamsKey    = @"mcluhan.url.params";


@implementation McLuhan

#pragma mark - Public API
+(void)callURLScheme:(NSString *)urlScheme
          completion:(CallURLSchemeCompletion)completion
{
    NSURL *url = [NSURL URLWithString:[McLuhan buildURLWithScheme:urlScheme]];
    [McLuhan callURL:url completion:completion];
}

+(void)callURLScheme:(NSString *)urlScheme
              action:(NSString *)action
               param:(NSString *)param
          completion:(CallURLSchemeCompletion)completion
{
    NSURL *url = [NSURL URLWithString:[McLuhan buildURLWithScheme:urlScheme action:action param:param]];
    [McLuhan callURL:url completion:completion];
}


#pragma mark - Internal API

+(void)callURL:(NSURL *)url completion:(CallURLSchemeCompletion)completion
{
    NSError *error;
    NSInteger errorCode = 0;
    
    if ([[UIApplication sharedApplication] canOpenURL:url] == NO) {errorCode = kCantOpenURL;}
    else if ([[UIApplication sharedApplication] openURL:url] == NO) {errorCode = kErrorOpeningURL;}
    
    if (errorCode) {error = [McLuhan errorWithCode:errorCode];}
    if (completion) {completion(url, error);}
}

+(NSString *)buildURLWithScheme:(NSString *)urlScheme
{
    NSString *raw = [NSString stringWithFormat:@"%@:", urlScheme];
    NSStringEncoding encoding = (NSStringEncoding)NSCharacterSet.URLQueryAllowedCharacterSet;
    return [raw stringByAddingPercentEscapesUsingEncoding:encoding];
}

+(NSString *)buildURLWithScheme:(NSString *)urlScheme
                         action:(NSString *)action
                          param:(NSString *)param
{
    NSString *raw = [NSString stringWithFormat:@"%@://%@/%@?%@", urlScheme, kXCallbackUrl, action, param];
    NSStringEncoding encoding = (NSStringEncoding)NSCharacterSet.URLQueryAllowedCharacterSet;
    return [raw stringByAddingPercentEscapesUsingEncoding:encoding];
}

+(NSError *)errorWithCode:(NSInteger)code
{
    return [NSError errorWithDomain:kMcLuhanErrorDomain code:code userInfo:nil];
}

@end
