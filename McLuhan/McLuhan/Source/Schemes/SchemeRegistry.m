//
//  SchemeRegistry.m
//  McLuhan
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "SchemeRegistry.h"


@interface SchemeRegistry ()
@end


@implementation SchemeRegistry

#pragma mark - Public API

-(void)addUrlScheme:(NSString *)urlScheme
{
    NSMutableDictionary *working = [self.urlSchemes mutableCopy];
    [working setObject:urlScheme forKey:urlScheme];
    _urlSchemes = [NSDictionary dictionaryWithDictionary:working];
}

-(void)removeUrlScheme:(NSString *)urlScheme
{
    NSMutableDictionary *working = [self.urlSchemes mutableCopy];
    [working removeObjectForKey:urlScheme];
    _urlSchemes = [NSDictionary dictionaryWithDictionary:working];
}

-(BOOL)containsUrlScheme:(NSString *)urlScheme
{
    return [self.urlSchemes objectForKey:urlScheme] != nil;
}


#pragma mark - Initialization

-(id)init
{
    self = [super init];
    if (self) {_urlSchemes = [NSDictionary new];}
    return self;
}

@end
