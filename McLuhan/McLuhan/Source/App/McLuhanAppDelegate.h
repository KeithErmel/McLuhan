//
//  McLuhanAppDelegate.h
//  McLuhan
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchemeRegistry.h"


@interface McLuhanAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, readonly) SchemeRegistry *schemeRegistry;
@end
