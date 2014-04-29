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


@interface SASendViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *sendTextInput;
@end


@implementation SASendViewController

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.sendTextInput resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
    
    [McLuhan invokeApp:kTargetAppUrl
            completion:^(NSURL *url, NSError *error) {if (error) {[self.delegate didFailToOpenURL:url];}}];
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
