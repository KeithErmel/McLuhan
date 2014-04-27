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

+(void)postToURLScheme:(NSString *)urlScheme
                action:(NSString *)action
                 param:(NSString *)param
               success:(PostToURLSchemeSuccess)success
               failure:(PostToURLSchemeFailure)failure
{
    NSError *error;
    NSURL *url = [NSURL URLWithString:[McLuhan buildURLForScheme:urlScheme action:action param:param]];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        if ([[UIApplication sharedApplication] openURL:url] == NO) {
            error = [McLuhan errorWithCode:kErrorOpeningURL url:url];
        }
    }
    else {
        error = [McLuhan errorWithCode:kCantOpenURL url:url];
    }
    
    if (error) {if (failure) {failure(error);}}
    else {if (success) {success(url);}}
}


#pragma mark - Internal API

+(NSString *)buildURLForScheme:(NSString *)urlScheme
                        action:(NSString *)action
                         param:(NSString *)param
{
    NSString *raw = [NSString stringWithFormat:@"%@://%@/%@?%@", urlScheme, kXCallbackUrl, action, param];
    NSStringEncoding encoding = (NSStringEncoding)NSCharacterSet.URLQueryAllowedCharacterSet;
    return [raw stringByAddingPercentEscapesUsingEncoding:encoding];
}

+(NSError *)errorWithCode:(NSInteger)code url:(NSURL *)url
{
    return [NSError errorWithDomain:kMcLuhanErrorDomain code:code userInfo:@{kMcLuhanErrorURLKey: url}];
}

@end
