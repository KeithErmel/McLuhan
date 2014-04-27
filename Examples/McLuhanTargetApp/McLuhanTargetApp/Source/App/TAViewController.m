//
//  TAViewController.m
//  McLuhanTargetApp
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "TAViewController.h"
#import "McLuhan/McLuhan.h"


NSString *const kSendAction     = @"send";


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


#pragma mark - Notification Handlers

-(void)customUrlSchemeRoutes:(NSNotification *)notification
{
    NSLog(@"customUrlSchemeRoutes: %@", notification.userInfo);
    NSString *action = notification.userInfo[kMcLuhanUrlActionKey];
    NSString *params = notification.userInfo[kMcLuhanUrlParamsKey];
    
    if ([action isEqualToString:kSendAction]) {
        [self acceptText:params];
    }
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(customUrlSchemeRoutes:)
                                                 name:kDidOpenUrlNotificationName
                                               object:nil];
    
}

@end
