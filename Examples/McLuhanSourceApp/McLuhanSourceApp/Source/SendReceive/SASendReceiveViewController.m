//
//  SASendReceiveViewController.m
//  SourceApp
//
//  Created by Keith Ermel on 4/24/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "SASendReceiveViewController.h"
#import "McLuhan/McLuhan.h"
#import "McLuhanExampleCommon/McLuhanExampleCommon.h"
#import "SAAppDelegate.h"


@interface SASendReceiveViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *sendTextInput;
@property (weak, nonatomic) IBOutlet UILabel *replyTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end


@implementation SASendReceiveViewController

#pragma mark - Public API

-(void)setReplyText:(NSString *)replyText
{
    _replyText = replyText;
    self.replyTextLabel.text = replyText;
}


#pragma mark - Internal API

-(void)didFailToOpenURL:(NSURL *)url
{
    self.statusLabel.text = [NSString stringWithFormat:@"Unable to open url: %@", url.absoluteString];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.sendTextInput) {
        [self.sendTextInput resignFirstResponder];
        [self.navigationController popViewControllerAnimated:YES];
        
        [McLuhan callURLScheme:kTargetAppUrl
                        action:kSendReceiveAction
                         param:self.sendTextInput.text
                    completion:^(NSURL *url, NSError *error) {
                        if (error) {[self didFailToOpenURL:url];}
                    }];
    }
    return YES;
}


#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sendTextInput.delegate = self;
    [self.sendTextInput becomeFirstResponder];
}

@end
