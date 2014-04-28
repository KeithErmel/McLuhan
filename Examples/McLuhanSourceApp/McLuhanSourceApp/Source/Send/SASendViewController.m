//
//  SASendViewController.m
//  SourceApp
//
//  Created by Keith Ermel on 4/24/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "SASendViewController.h"
#import "McLuhan/McLuhan.h"
#import "McLuhanExampleCommon/McLuhanExampleCommon.h"
#import "SAAppDelegate.h"


@interface SASendViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *sendTextInput;
@end


@implementation SASendViewController

#pragma mark - Public API

-(void)sendMessage:(NSString *)message {[self callTargetAppWithText:message];}


#pragma mark - Internal API

-(void)callTargetAppWithText:(NSString *)text
{
    [McLuhan callURLScheme:kTargetAppUrl
                    action:kSendAction
                     param:text
                completion:^(NSURL *url, NSError *error) {if (error) {[self.delegate didFailToOpenURL:url];}}];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.sendTextInput resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
    [self callTargetAppWithText:self.sendTextInput.text];
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
