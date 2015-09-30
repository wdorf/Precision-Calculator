//
//  NewCalculatorUITests.m
//  NewCalculatorUITests
//
//  Created by Vaghasiya, Soham A on 9/30/15.
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

- (void)testAddMultiply {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"("] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"5"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@")"] tap];
    [app.buttons[@"*"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"="] tap];
    XCUIElement *display = app.staticTexts[@"56"];
    XCTAssertTrue(display.exists);
    
}

- (void)testDivision {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"("] tap];
    
    XCUIElement *button = app.buttons[@"9"];
    [button tap];
    [app.buttons[@"*"] tap];
    [app.buttons[@"8"] tap];
    [app.buttons[@")"] tap];
    [app.buttons[@"/"] tap];
    [button tap];
    [app.buttons[@"="] tap];
    XCUIElement *display = app.staticTexts[@"8"];
    XCTAssertTrue(display.exists);
    
}

- (void)testFactorialSqrtPrecisionMode {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *testeButton = [[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0];
    [testeButton tap];
    [app.buttons[@"4"] tap];
    [app.buttons[@"!"] tap];
    [app.buttons[@"sqrt"] tap];
    XCUIElement *display = app.staticTexts[@"4.90"];
    XCTAssertTrue(display.exists);
}

- (void)testSinCos{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"1"] tap];
    [app.buttons[@"."] tap];
    [app.buttons[@"5"] tap];
    [app.buttons[@"7"] tap];
    [app.buttons[@"sin"] tap];
    XCUIElement *display = app.staticTexts[@"1"];
    XCTAssertTrue(display.exists);
    [app.buttons[@"C"] tap];
    [app.buttons[@"cos"] tap];
    XCTAssertTrue(display.exists);    
}

@end
