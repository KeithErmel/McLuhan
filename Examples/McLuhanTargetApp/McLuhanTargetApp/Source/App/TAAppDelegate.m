//
//  TAAppDelegate.m
//  McLuhanTargetApp
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "TAAppDelegate.h"


NSString *const kTargetAppUrl   = @"mcluhan.targetapp";


@implementation TAAppDelegate

#pragma mark - McLuhanResponder

-(BOOL)canOpenUrlScheme:(NSString *)urlScheme {return [urlScheme isEqualToString:kTargetAppUrl];}


#pragma mark - Application Lifecycle

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

@end
