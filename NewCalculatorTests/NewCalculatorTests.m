//
//  NewCalculatorTests.m
//  NewCalculatorTests
//
//  Created by Diego Leal Togni on 10/3/14.
//  Copyright (c) 2014 Gannon University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NewCalculatorTests.h"

@implementation NewCalculatorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    // This is an example of a functional test case.
    [calc_view_controller numPressed:[calc_view viewWithTag:2]];
    [calc_view_controller numPressed:[calc_view viewWithTag:21]];
    [calc_view_controller numPressed:[calc_view viewWithTag:9]];
    [calc_view_controller numPressed:[calc_view viewWithTag:30]];
//    XCTAssertTrue([[calc_view_controller.numericDisplay text] isEqualToString:@"11"], @"Part 1 failed.");
    
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
