//
//  SAAppDelegate.h
//  McLuhanSourceApp
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "McLuhan/McLuhan.h"
#import "McLuhan/McLuhanAppDelegate.h"


@interface SAAppDelegate : McLuhanAppDelegate

+(SAAppDelegate *)appDelegate;
-(void)callTargetAppWithText:(NSString *)text completion:(CallURLSchemeCompletion)completion;
@end
