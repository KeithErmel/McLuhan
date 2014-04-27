//
//  TAAppDelegate.m
//  McLuhanTargetApp
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "TAAppDelegate.h"
#import "McLuhan/McLuhan.h"


NSString *const kTargetAppUrl   = @"mcluhan.targetapp";


@implementation TAAppDelegate

#pragma mark - Application Lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}


#pragma mark - URL Schemes

-(BOOL)application:(UIApplication *)application
           openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication
        annotation:(id)annotation
{
    NSLog(@"application:openURL - url.scheme: %@", url.scheme);
    NSLog(@"  url: %@", url);
    
    if ([url.scheme isEqualToString:kTargetAppUrl]) {
        NSLog(@"     host: %@", url.host);
        NSLog(@"     path: %@", url.path);
        NSLog(@"    query: %@", url.query);
        
        if ([url.host isEqualToString:kXCallbackUrl]) {
            NSString *action = [url.path substringFromIndex:1];
            NSString *params = url.query ? url.query : @"";
            NSLog(@"      action: %@", action);
            NSLog(@"      params: %@", params);
            
            [self notifyReceivedCustomUrl:action params:params];
        }
    }
    return YES;
}


#pragma mark - Internal API

-(void)notifyReceivedCustomUrl:(NSString *)action params:(NSString *)params
{
    NSDictionary *info = @{kMcLuhanUrlActionKey: action, kMcLuhanUrlParamsKey: params};
    [[NSNotificationCenter defaultCenter] postNotificationName:kDidOpenUrlNotificationName
                                                        object:nil
                                                      userInfo:info];
}

@end
