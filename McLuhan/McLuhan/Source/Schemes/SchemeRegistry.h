//
//  SchemeRegistry.h
//  McLuhan
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SchemeRegistry : NSObject
@property (strong, readonly) NSDictionary *urlSchemes;

-(void)addUrlScheme:(NSString *)urlScheme;
-(void)removeUrlScheme:(NSString *)urlScheme;
-(BOOL)containsUrlScheme:(NSString *)urlScheme;
@end
