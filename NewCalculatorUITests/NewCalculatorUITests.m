//
//  NewCalculatorUITests.m
//  NewCalculatorUITests
//
//  Created by Hind Almushigih on 29/9/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NewCalculatorUITests : XCTestCase

@end

@implementation NewCalculatorUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
- (void)testAddition {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"2"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    XCTAssert(app.staticTexts[@"5"].exists);
}
- (void)testMultiplication{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"2"] tap];
    [app.buttons[@"*"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    XCTAssert(app.staticTexts[@"6"].exists);
}
- (void)testSubtraction {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"2"] tap];
    [app.buttons[@"-"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    XCTAssert(app.staticTexts[@"-1"].exists);
    
}
- (void)testDivision {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"3"] tap];
    [app.buttons[@"/"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    XCTAssert(app.staticTexts[@"1"].exists);
}



@end
