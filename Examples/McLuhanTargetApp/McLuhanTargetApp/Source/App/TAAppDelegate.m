//
//  TAAppDelegate.m
//  McLuhanTargetApp
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "TAAppDelegate.h"
#import "TACommon.h"


@implementation TAAppDelegate

#pragma mark - Application Lifecycle

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.schemeRegistry addUrlScheme:kTargetAppUrl];
    return YES;
}

@end
