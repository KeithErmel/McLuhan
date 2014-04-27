//
//  SASendViewController.h
//  SourceApp
//
//  Created by Keith Ermel on 4/24/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SASendViewControllerDelegate <NSObject>
-(void)didFailToOpenURL:(NSURL *)url;
@end


@interface SASendViewController : UIViewController
@property (weak, nonatomic) id<SASendViewControllerDelegate> delegate;

-(void)sendMessage:(NSString *)message;
@end
