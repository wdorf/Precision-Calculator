//
//  NewCalculatorTests.m
//  NewCalculatorTests
//
//  Created by Diego Leal Togni on 10/3/14.
//  Copyright (c) 2014 Gannon University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AppDelegate.h"
#import "ViewController.h"


@interface NewCalculatorTests : XCTestCase
{
@private
    AppDelegate    *app_delegate;
    ViewController *viewController;
    UIView             *calc_view;
    
}

@end

@implementation NewCalculatorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    app_delegate         = [[UIApplication sharedApplication] delegate];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    viewController = [storyboard instantiateViewControllerWithIdentifier:@"CalcViewController"];
    calc_view            = viewController.view;
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void) testAddition {
    [viewController numPressed:[calc_view viewWithTag: 6]];  // 6
    [viewController operationPressed:[calc_view viewWithTag:13]];  // +
    [viewController numPressed:[calc_view viewWithTag: 2]];  // 2
    [viewController equalPressed:[calc_view viewWithTag:12]];  // =
    XCTAssertTrue([[viewController.numericDisplay text] isEqualToString:@"8"], @"Part 1 failed.");
    
    [viewController operationPressed:[calc_view viewWithTag:13]];  // +
    [viewController numPressed:[calc_view viewWithTag: 2]];  // 2
    [viewController equalPressed:[calc_view viewWithTag:12]];  // =
    XCTAssertTrue([[viewController.numericDisplay text] isEqualToString:@"10"], @"Part 2 failed.");
}

@end
