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


NSString *const kSourceTargetOneWaySegue    = @"sourceTargetOneWaySegue";
NSString *const kSourceTargetTwoWaySegue    = @"sourceTargetTwoWaySegue";


@interface SAViewController ()
@end


@implementation SAViewController


#pragma mark - Configuration

-(void)configureSourceVC:(UIStoryboardSegue *)segue
{
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
