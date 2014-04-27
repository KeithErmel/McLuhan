//
//  McLuhanAppDelegate.h
//  McLuhan
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol McLuhanResponder <NSObject>
-(BOOL)canOpenUrlScheme:(NSString *)urlScheme;
@end


@interface McLuhanAppDelegate : UIResponder <UIApplicationDelegate, McLuhanResponder>
@property (strong, nonatomic) UIWindow *window;
@end
