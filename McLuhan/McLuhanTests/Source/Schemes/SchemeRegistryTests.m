//
//  SchemeRegistryTests.m
//  McLuhan
//
//  Created by Keith Ermel on 4/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SchemeRegistry.h"


@interface SchemeRegistryTests : XCTestCase
@property (strong, nonatomic, readonly) SchemeRegistry *registry;
@end


@implementation SchemeRegistryTests

- (void)setUp
{
    [super setUp];
    _registry = [SchemeRegistry new];
}

- (void)tearDown
{
    _registry = nil;
    [super tearDown];
}

- (void)test_that_SchemeRegistry_can_be_constructed
{
    XCTAssertNotNil(self.registry, @"self.registry should not be nil");
}

-(void)test_that_SchemeRegistry_urlSchemes_is_not_nil_after_construction
{
    XCTAssertNotNil(self.registry.urlSchemes, @"urlSchemes should not be nil after construction");
}

-(void)test_that_SchemeRegistry_is_empty_after_construction
{
    XCTAssertTrue(self.registry.urlSchemes.count == 0, @"registry should be empty after construction");
}

-(void)test_that_addUrlScheme_throws_exception_when_urlScheme_is_nil
{
    NSString *urlScheme;
    XCTAssertThrows([self.registry addUrlScheme:urlScheme], @"should have thrown exception");
}

-(void)test_that_addUrlScheme_can_add_scheme
{
    NSString *urlScheme = @"scheme.registry.scheme";
    [self.registry addUrlScheme:urlScheme];
    XCTAssertTrue(self.registry.urlSchemes.count == 1, @"there should be 1 urlScheme in the registry");
    
    NSString *result = [self.registry.urlSchemes objectForKey:urlScheme];
    XCTAssertNotNil(result, @"result should not be nil");
    XCTAssertEqual(result, urlScheme, @"result should equal '%@'", urlScheme);
}

-(void)test_that_removeUrlScheme_can_remove_scheme
{
    NSString *urlScheme = @"scheme.registry.scheme";
    [self.registry addUrlScheme:urlScheme];
    XCTAssertTrue(self.registry.urlSchemes.count == 1, @"there should be 1 urlScheme in the registry");

    [self.registry removeUrlScheme:urlScheme];
    NSString *result = [self.registry.urlSchemes objectForKey:urlScheme];
    XCTAssertNil(result, @"%@ has been removed from registry, so result should be nil", urlScheme);
    XCTAssertEqual(self.registry.urlSchemes.count, 0, @"registry should be empty");
}

-(void)test_that_containsUrlScheme_returns_NO_when_given_nil
{
    NSString *urlScheme;
    BOOL result = [self.registry containsUrlScheme:urlScheme];
    XCTAssertFalse(result, @"result should be NO");
}

-(void)test_that_containsUrlScheme_returns_NO_when_registry_is_empty
{
    NSString *urlScheme = @"foo";
    BOOL result = [self.registry containsUrlScheme:urlScheme];
    XCTAssertFalse(result, @"result should be NO");
}

-(void)test_that_containsUrlScheme_returns_NO_when_registry_does_not_contain_urlScheme
{
    [self.registry addUrlScheme:@"scheme.registry.scheme"];
    XCTAssertTrue(self.registry.urlSchemes.count == 1, @"there should be 1 urlScheme in the registry");

    NSString *urlScheme = @"foo";
    BOOL result = [self.registry containsUrlScheme:urlScheme];
    XCTAssertFalse(result, @"result should be NO");
}

-(void)test_that_containsUrlScheme_returns_YES_when_registry_contains_urlScheme
{
    NSString *urlScheme = @"scheme.registry.scheme";
    [self.registry addUrlScheme:@"scheme.registry.scheme"];
    XCTAssertTrue(self.registry.urlSchemes.count == 1, @"there should be 1 urlScheme in the registry");
    
    BOOL result = [self.registry containsUrlScheme:urlScheme];
    XCTAssertTrue(result, @"result should be YES");
}

@end
