//
//  NewCalculatorUITests.m
//  NewCalculatorUITests
//
//  Created by Orlando, Marco J on 9/26/15. aaaaa
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

- (void)testAddition{
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"C"] tap];
    [app.buttons[@"6"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    XCUIElement *display = app.staticTexts[@"9"];
    XCTAssertTrue(display.exists);
    display = app.staticTexts[@"6+3"];
    XCTAssertTrue(display.exists);
}

- (void)testSubtraction{
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"C"] tap];
    [app.buttons[@"9"] tap];
    [app.buttons[@"-"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"="] tap];

    XCUIElement *display = app.staticTexts[@"7"];
    XCTAssertTrue(display.exists);
    display = app.staticTexts[@"9-2"];
    XCTAssertTrue(display.exists);
}

- (void)testMultiplication{
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"C"] tap];
    [app.buttons[@"5"] tap];
    [app.buttons[@"*"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"="] tap];
    
    
    XCUIElement *display = app.staticTexts[@"10"];
    XCTAssertTrue(display.exists);
    display = app.staticTexts[@"5*2"];
}

- (void)testDivision{
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"C"] tap];
    [app.buttons[@"1"] tap];
    XCUIElement *button = app.buttons[@"5"];
    [button tap];
    [app.buttons[@"/"] tap];
    [button tap];
    [app.buttons[@"="] tap];
    
    
    XCUIElement *display = app.staticTexts[@"3"];
    XCTAssertTrue(display.exists);
    display = app.staticTexts[@"15/5"];
}

- (void)testSin{
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"C"] tap];
    [app.buttons[@"0"] tap];
    [app.buttons[@"sin"] tap];
    [app.buttons[@"="] tap];
    XCUIElement *display = app.staticTexts[@"0"];
    XCTAssertTrue(display.exists);
    
}

- (void)testCos{
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"C"] tap];
    [app.buttons[@"0"] tap];
    [app.buttons[@"cos"] tap];
    [app.buttons[@"="] tap];
    XCUIElement *display = app.staticTexts[@"1"];
    XCTAssertTrue(display.exists);
    
}

- (void)testSqrt{
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"C"] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"6"] tap];
    [app.buttons[@"sqrt"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display = app.staticTexts[@"4"];
    XCTAssertTrue(display.exists);
    
    
}

- (void)testFactorial{
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"C"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"!"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display = app.staticTexts[@"6"];
    XCTAssertTrue(display.exists);
    
}

- (void)testInverse{
    // Use recording to get started writing UI tests.

    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button = app.buttons[@"1/x"];
    [button tap];
    [app.buttons[@"C"] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"0"] tap];
    [button tap];
    XCUIElement *display = app.staticTexts[@"0.1"];
    XCTAssertTrue(display.exists);
}

- (void)testSquared{
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"C"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"x^2"] tap];
    
    XCUIElement *display = app.staticTexts[@"9"];
    XCTAssertTrue(display.exists);
}

- (void)testExponent{
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"C"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"x^y"] tap];
    [app.buttons[@"4"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display = app.staticTexts[@"16"];
    XCTAssertTrue(display.exists);
}

- (void)testfactorial{
    // Use recording to get started writing UI tests.
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"6"] tap];
    
    XCUIElement *button = app.buttons[@"."];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"2"];
    [button2 tap];
    
    XCUIElement *button3 = app.buttons[@"5"];
    [button3 tap];
    [app.buttons[@"-"] tap];
    [app.buttons[@"1"] tap];
    [button tap];
    [button2 tap];
    [button3 tap];
    [app.buttons[@"="] tap];
    
    
    XCUIElement *display = app.staticTexts[@"5.00"];
    XCTAssertTrue(display.exists);
    
    
    XCUIApplication *app2 = [[XCUIApplication alloc] init];
    [app2.buttons[@"C"] tap];
    [[[[[app2.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [app2.buttons[@"3"] tap];
    
    XCUIElement *button4 = app2.buttons[@"."];
    [button4 tap];
    
    XCUIElement *button5 = app2.buttons[@"2"];
    [button5 tap];
    
    XCUIElement *button6 = app2.buttons[@"5"];
    [button6 doubleTap];
    [app2.buttons[@"-"] tap];
    [button4 tap];
    [button5 tap];
    [button6 doubleTap];
    [app2.buttons[@"="] tap];

    display = app.staticTexts[@"3.000"];
    XCTAssertTrue(display.exists);
    
    
}

- (void)testSolveEquationRecursive{
    //test many different operations in successionn
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"6"] tap];
    [app.buttons[@"+/-"] tap];
    [app.buttons[@"!"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display = app.staticTexts[@"1"];
    XCTAssertTrue(display.exists);
}


@end
