//
//  SAViewController.m
//  McLuhanSourceApp
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import "SAViewController.h"
#import "Luokat/UIStoryboardSegue+Utils.h"
#import "SASendReceiveViewController.h"
#import "SASendViewController.h"


NSString *const kSourceTargetOneWaySegue    = @"sourceTargetOneWaySegue";
NSString *const kSourceTargetTwoWaySegue    = @"sourceTargetTwoWaySegue";


@interface SAViewController ()<SASendViewControllerDelegate>
// Outlets
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end


@implementation SAViewController

#pragma mark - SASendViewControllerDelegate

-(void)didFailToOpenURL:(NSURL *)url
{
    self.statusLabel.text = [NSString stringWithFormat:@"Unable to open url: %@", url.absoluteString];
}


#pragma mark - Configuration

-(void)configureSourceVC:(UIStoryboardSegue *)segue
{
    ((SASendViewController *)segue.destinationViewController).delegate = self;
}

-(void)configureTargetVC:(UIStoryboardSegue *)segue
{
}


#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue isNamed:kSourceTargetOneWaySegue]) {[self configureSourceVC:segue];}
    else if ([segue isNamed:kSourceTargetTwoWaySegue]) {[self configureTargetVC:segue];}
}


#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
