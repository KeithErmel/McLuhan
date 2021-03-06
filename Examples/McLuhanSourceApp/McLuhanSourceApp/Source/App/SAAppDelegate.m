//
//  SAAppDelegate.m
//  McLuhanSourceApp
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "SAAppDelegate.h"
#import "McLuhanExampleCommon/McLuhanExampleCommon.h"


@implementation SAAppDelegate

#pragma mark - Public API

+(SAAppDelegate *)appDelegate
{
    return (SAAppDelegate *)[UIApplication sharedApplication].delegate;
}


#pragma mark - Application Lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.schemeRegistry addUrlScheme:kSourceAppUrl];
    return YES;
}

@end
