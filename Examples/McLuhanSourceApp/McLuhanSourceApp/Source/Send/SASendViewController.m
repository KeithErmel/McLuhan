//
//  SASendViewController.m
//  SourceApp
//
//  Created by Keith Ermel on 4/24/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "SASendViewController.h"
#import "McLuhan/McLuhan.h"
#import "SACommon.h"
#import "SAAppDelegate.h"


@interface SASendViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *sendTextInput;
@end


@implementation SASendViewController

#pragma mark - Public API

-(void)sendMessage:(NSString *)message {[self postToTargetAppWithText:message];}


#pragma mark - Internal API

-(void)postToTargetAppWithText:(NSString *)text
{
    [McLuhan postToURLScheme:kTargetAppUrl action:kSendAction param:text success:nil failure:^(NSError *error) {
        NSURL *url = [error.userInfo objectForKey:kMcLuhanErrorURLKey];
        [self.delegate didFailToOpenURL:url];
    }];
}

-(NSString *)buildURLStringWithText:(NSString *)text
{
    NSString *raw = [NSString stringWithFormat:@"%@://%@/%@?%@", kTargetAppUrl, kXCallbackUrl, kSendAction, text];
    NSStringEncoding encoding = (NSStringEncoding)NSCharacterSet.URLQueryAllowedCharacterSet;
    return [raw stringByAddingPercentEscapesUsingEncoding:encoding];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.sendTextInput resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
    [self postToTargetAppWithText:self.sendTextInput.text];
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
