//
//  SASendActionsViewController.m
//  McLuhanSourceApp
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "SASendActionsViewController.h"
#import "Luokat/UIStoryboardSegue+Utils.h"
#import "McLuhan/McLuhan.h"
#import "McLuhanExampleCommon/McLuhanExampleCommon.h"
#import "SASendViewController.h"


NSString *const kSendMessageSegue   = @"sendMessageSegue";


@interface SASendActionsViewController ()<SASendViewControllerDelegate>
@property (strong, readonly) SASendViewController *sendVC;
// Outlets
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end


@implementation SASendActionsViewController

#pragma mark - SASendViewControllerDelegate

-(void)didFailToOpenURL:(NSURL *)url
{
    self.statusLabel.text = [NSString stringWithFormat:@"Unable to open url: %@", url.absoluteString];
}


#pragma mark - Actions

-(IBAction)sendTestAction:(id)sender
{
    [McLuhan invokeApp:kTargetAppUrl
                action:kSendAction
                 param:kTestMessage
            completion:^(NSURL *url, NSError *error) {if (error) {[self didFailToOpenURL:url];}
    }];
}


#pragma mark - Configuration

-(void)configureSendMessageVC:(UIStoryboardSegue *)segue
{
    _sendVC = (SASendViewController *)segue.destinationViewController;
    self.sendVC.delegate = self;
}


#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue isNamed:kSendMessageSegue]) {[self configureSendMessageVC:segue];}
}



#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
