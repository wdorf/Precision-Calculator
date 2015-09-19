//
//  NewCalculatorTests.m
//  NewCalculatorTests
//
//  Created by Diego Leal Togni on 10/3/14.
//  Copyright (c) 2014 Gannon University. All rights reserved.
//


#import "NewCalculatorTests.h"



@implementation NewCalculatorTests

- (void)setUp {
    app_delegate         = [[UIApplication sharedApplication] delegate];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    calc_view_controller = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    calc_view            = calc_view_controller.view;
}

- (void) testAppDelegate {
    XCTAssertNotNil(app_delegate, @"Cannot find the application delegate");
}

- (void) testAddition {
    [calc_view_controller numPressed:[calc_view viewWithTag: 6]];  // 6
    [calc_view_controller numPressed:[calc_view viewWithTag:13]];  // +
    [calc_view_controller numPressed:[calc_view viewWithTag: 2]];  // 2
    [calc_view_controller numPressed:[calc_view viewWithTag:11]];  // =
    XCTAssertTrue([[calc_view_controller.numericDisplay text] isEqualToString:@"8"], @"Part 1 failed.");
}

/*
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
 */

@end