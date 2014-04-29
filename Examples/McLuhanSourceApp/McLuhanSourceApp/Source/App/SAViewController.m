//
//  SAViewController.m
//  McLuhanSourceApp
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "SAViewController.h"
#import "Luokat/UIStoryboardSegue+Utils.h"
#import "McLuhan/McLuhan.h"
#import "McLuhanExampleCommon/McLuhanExampleCommon.h"
#import "SASendReceiveViewController.h"


NSString *const kSourceTargetTwoWaySegue    = @"sourceTargetTwoWaySegue";


@interface SAViewController ()
@property (strong, nonatomic, readonly) SASendReceiveViewController *sendReceiveVC;
@end


@implementation SAViewController

#pragma mark - Internal API

-(void)acceptReply:(NSString *)params
{
    self.sendReceiveVC.replyText = params;
}


#pragma mark - Notification Handlers

-(void)customUrlSchemeRoutes:(NSNotification *)notification
{
    NSLog(@"customUrlSchemeRoutes: %@", notification.userInfo);
    NSString *action = notification.userInfo[kMcLuhanUrlActionKey];
    NSString *params = notification.userInfo[kMcLuhanUrlParamsKey];
    
    if ([action isEqualToString:kReplyAction]) {[self acceptReply:params];}
}

#pragma mark - Configuration

-(void)configureSendReceiveVC:(UIStoryboardSegue *)segue
{
    _sendReceiveVC = (SASendReceiveViewController *)segue.destinationViewController;
}


#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue isNamed:kSourceTargetTwoWaySegue]) {
        [self configureSendReceiveVC:segue];
    }
}


#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(customUrlSchemeRoutes:)
                                                 name:kDidOpenUrlNotificationName
                                               object:nil];
}

@end
