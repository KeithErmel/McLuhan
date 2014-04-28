//
//  McLuhan.h
//  McLuhan
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *const kXCallbackUrl;

extern NSString *const kDidOpenUrlNotificationName;
extern NSString *const kMcLuhanUrlActionKey;
extern NSString *const kMcLuhanUrlParamsKey;

extern NSString *const kMcLuhanErrorDomain;
extern NSInteger const kCantOpenURL;
extern NSInteger const kErrorOpeningURL;
extern NSString *const kMcLuhanErrorURLKey;

typedef void(^CallURLSchemeCompletion)(NSURL *url, NSError *error);


@interface McLuhan : NSObject
+(void)callURLScheme:(NSString *)urlScheme
          completion:(CallURLSchemeCompletion)completion;

+(void)callURLScheme:(NSString *)urlScheme
              action:(NSString *)action
               param:(NSString *)param
          completion:(CallURLSchemeCompletion)completion;
@end
