//
//  smellTesting_Dinesh.m
//  smellTesting_Dinesh
//
//  Created by Senthil Arumugam, Dinesharumugam on 9/30/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface smellTesting_Dinesh : XCTestCase

@end

@implementation smellTesting_Dinesh

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

- (void)testAdditionSubtractionMultiplicationDivision {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button = app.buttons[@"3"];
    [button tap];
    [app.buttons[@"+"] tap];
    [button tap];
    [app.buttons[@"*"] tap];
    [app.buttons[@"5"] tap];
    [app.buttons[@"-"] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"0"] tap];
    [app.buttons[@"/"] tap];
    [app.buttons[@"4"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display = app.staticTexts[@"5"];
    XCTAssertTrue(display.exists);
}

- (void)testSqrtfactorialFixedMode {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"/"] tap];
    
    XCUIElement *button3 = app.buttons[@"6"];
    [button3 tap];
    
    XCUIElement *button = app.buttons[@"="];
    [button tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"."] tap];
    [app.buttons[@"5"] tap];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"!"];
    [button2 tap];
    [button tap];
    
    XCUIElement *cButton = app.buttons[@"C"];
    [cButton tap];
    [app.buttons[@"2"] tap];
    [button2 tap];
    [cButton tap];
    [button3 tap];
    [button2 tap];
    [button tap];
    [app.buttons[@"sqrt"] tap];
    [button tap];
    
    
    XCUIElement *display = app.staticTexts[@"26.83"];
    XCTAssertTrue(display.exists);
    
    
}

- (void)testPowersDynamicMode {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button3 = app.buttons[@"3"];
    [button3 tap];
    
    XCUIElement *x2Button = app.buttons[@"x^2"];
    [x2Button tap];
    
    XCUIElement *button = app.buttons[@"="];
    [button tap];
    
    XCUIElement *cButton = app.buttons[@"C"];
    [cButton tap];
    
    XCUIElement *button5 = app.buttons[@"6"];
    [button5 tap];
    
    XCUIElement *xYButton = app.buttons[@"x^y"];
    [xYButton tap];
    
    XCUIElement *button4 = app.buttons[@"2"];
    [button4 tap];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"9"];
    [button2 tap];
    [xYButton tap];
    [button2 tap];
    [button tap];
    [button doubleTap];
    [button tap];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"9"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [cButton tap];
    [button3 tap];
    [x2Button tap];
    
    XCUIElement *button6 = app.buttons[@"/"];
    [button6 tap];
    [button4 tap];
    [button tap];
    [cButton tap];
    [button5 tap];
    [xYButton tap];
    [button4 tap];
    [button tap];
    [button6 tap];
    [app.buttons[@"7"] tap];
    [button tap];
    [button tap];
    
    XCUIElement *display = app.staticTexts[@"1.36111"];
    XCTAssertTrue(display.exists);
}

@end
