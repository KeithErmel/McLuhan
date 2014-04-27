//
//  SASendViewController.m
//  SourceApp
//
//  Created by Keith Ermel on 4/24/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "SASendViewController.h"
#import "McLuhan/McLuhan.h"
#import "SAAppDelegate.h"


NSString *const kTargetAppUrl   = @"mcluhan.targetapp";
NSString *const kSendAction     = @"send";


@interface SASendViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *sendTextInput;
@end


@implementation SASendViewController


#pragma mark - Internal API

-(void)postToTargetApp
{
    NSURL *url = [NSURL URLWithString:[self buildURLString]];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    else {
        [self.delegate didFailToOpenURL:url];
    }
}

-(NSString *)buildURLString
{
    NSString *raw = [NSString stringWithFormat:@"%@://%@/%@?%@",
                     kTargetAppUrl, kXCallbackUrl, kSendAction, self.sendTextInput.text];
    NSStringEncoding encoding = (NSStringEncoding)NSCharacterSet.URLQueryAllowedCharacterSet;
    return [raw stringByAddingPercentEscapesUsingEncoding:encoding];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.sendTextInput resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
    [self postToTargetApp];
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
