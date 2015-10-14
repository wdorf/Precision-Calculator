//
//  NewCalculatorTests.m
//  NewCalculatorTests
//
//  Created by Diego Leal Togni on 10/3/14.
//  Copyright (c) 2014 Gannon University. All rights reserved.
//

//
//  NewCalculatorTests.m
//  NewCalculator
//
//  Created by Hind Almushigih on 22/9/15.
//  Copyright © 2015 Gannon University. All rights reserved.
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
    app_delegate = [[UIApplication sharedApplication] delegate];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    viewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    calc_view = viewController.view;
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void) testAppDelegate {
    XCTAssertNotNil(app_delegate, @"Cannot find the application delegate");
}

- (void) testAddition {
    
    [viewController numPressed:[calc_view viewWithTag: 6]];  // 6
    [viewController operationPressed:[calc_view viewWithTag: 13]];  // +
    [viewController numPressed:[calc_view viewWithTag: 3]];  // 3
    [viewController equalPressed:[calc_view viewWithTag: 11]];  // =
    XCTAssertTrue([[viewController.numericDisplay text] isEqualToString:@"9"], @"Part 1 failed.");
    
}
- (void) testMultiplication {
    
    [viewController numPressed:[calc_view viewWithTag: 6]];  // 6
    [viewController operationPressed:[calc_view viewWithTag: 11]];  // *
    [viewController numPressed:[calc_view viewWithTag: 3]];  // 3
    [viewController equalPressed:[calc_view viewWithTag: 11]];  // =
    XCTAssertTrue([[viewController.numericDisplay text] isEqualToString:@"18"], @"Part 2 failed.");
    
}
- (void) testSubtraction {
    
    [viewController numPressed:[calc_view viewWithTag: 6]];  // 6
    [viewController operationPressed:[calc_view viewWithTag: 14]];  // -
    [viewController numPressed:[calc_view viewWithTag: 3]];  // 3
    [viewController equalPressed:[calc_view viewWithTag: 11]];  // =
    XCTAssertTrue([[viewController.numericDisplay text] isEqualToString:@"3"], @"Part 3 failed.");
    
}
- (void) testDivision {
    
    [viewController numPressed:[calc_view viewWithTag: 6]];  // 6
    [viewController operationPressed:[calc_view viewWithTag: 12]];  // /
    [viewController numPressed:[calc_view viewWithTag: 3]];  // 3
    [viewController equalPressed:[calc_view viewWithTag: 11]];  // =
    XCTAssertTrue([[viewController.numericDisplay text] isEqualToString:@"2"], @"Part 4 failed.");
}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
