//
//  TAViewController.m
//  McLuhanTargetApp
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "TAViewController.h"
#import "McLuhan/McLuhan.h"
#import "McLuhanExampleCommon/McLuhanExampleCommon.h"


@interface TAViewController ()
// Outlets
@property (weak, nonatomic) IBOutlet UILabel *receivedTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end

@implementation TAViewController

#pragma mark - Internal API

-(void)acceptText:(NSString *)params
{
    self.receivedTextLabel.text = params;
}

-(void)didFailToOpenURL:(NSURL *)url
{
    self.statusLabel.text = [NSString stringWithFormat:@"Unable to open url: %@", url.absoluteString];
}


#pragma mark - Actions

-(IBAction)returnToSourceAction:(id)sender
{
    [McLuhan callURLScheme:kSourceAppUrl
                completion:^(NSURL *url, NSError *error) {if (error) {[self didFailToOpenURL:url];}}];
}


#pragma mark - Notification Handlers

-(void)customUrlSchemeRoutes:(NSNotification *)notification
{
    NSLog(@"customUrlSchemeRoutes: %@", notification.userInfo);
    NSString *action = notification.userInfo[kMcLuhanUrlActionKey];
    NSString *params = notification.userInfo[kMcLuhanUrlParamsKey];
    
    if ([action isEqualToString:kSendAction]) {[self acceptText:params];}
}

#pragma mark - View Lifecycle

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(customUrlSchemeRoutes:)
                                                 name:kDidOpenUrlNotificationName
                                               object:nil];
}

@end
