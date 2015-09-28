//
//  NewCalculatorUITests.m
//  NewCalculatorUITests
//
//  Created by Moradiya, Bhavik K on 9/27/15.
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
-(void)testAddition{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"6"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"9"];
    XCTAssertTrue(display.exists);
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    display= app.staticTexts[@"69"];
    XCTAssertTrue(display.exists);
    
}
-(void)testSubtraction{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"6"] tap];
    [app.buttons[@"-"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"3"];
    XCTAssertTrue(display.exists);
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"-"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    display= app.staticTexts[@"63"];
    XCTAssertTrue(display.exists);
}
-(void)testMultiplucation{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"6"] tap];
    [app.buttons[@"*"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"18"];
    XCTAssertTrue(display.exists);
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"*"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    display= app.staticTexts[@"198"];
    XCTAssertTrue(display.exists);}
-(void)testDivision{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"6"] tap];
    [app.buttons[@"/"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"2"];
    XCTAssertTrue(display.exists);
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"/"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    display= app.staticTexts[@"22"];
    XCTAssertTrue(display.exists);
}
- (void)testEPrecisionSub {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    
    XCUIElement *button = app.buttons[@"2"];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"."];
    [button2 tap];
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"-"] tap];
    [button tap];
    [button2 tap];
    [app.buttons[@"3"] doubleTap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"0.33"];
    display= app.staticTexts[@"0.33"];
    XCTAssertTrue(display.exists);
}
- (void)testEPrecisionAdd {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    
    XCUIElement *button = app.buttons[@"2"];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"."];
    [button2 tap];
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"+"] tap];
    [button tap];
    [button2 tap];
    [app.buttons[@"3"] doubleTap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"4.99"];
    display= app.staticTexts[@"4.99"];
    XCTAssertTrue(display.exists);
}
- (void)testEPrecisionMul {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    
    XCUIElement *button = app.buttons[@"2"];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"."];
    [button2 tap];
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"*"] tap];
    [button tap];
    [button2 tap];
    [app.buttons[@"3"] doubleTap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"6.20"];
    display= app.staticTexts[@"6.20"];
    XCTAssertTrue(display.exists);
}
- (void)testEPrecisionDiv {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    
    XCUIElement *button = app.buttons[@"2"];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"."];
    [button2 tap];
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"/"] tap];
    [button tap];
    [button2 tap];
    [app.buttons[@"3"] doubleTap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"1.14"];
    display= app.staticTexts[@"1.14"];
    XCTAssertTrue(display.exists);
}
- (void)testDaynicPrecisionAdd {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    
    XCUIElement *button = app.buttons[@"2"];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"."];
    [button2 tap];
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"+"] tap];
    [button tap];
    [button2 tap];
    [app.buttons[@"3"] doubleTap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"4.99"];
    display= app.staticTexts[@"4.99"];
    XCTAssertTrue(display.exists);
}
- (void)testDaynicPrecisionSub {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    
    XCUIElement *button = app.buttons[@"2"];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"."];
    [button2 tap];
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"-"] tap];
    [button tap];
    [button2 tap];
    [app.buttons[@"3"] doubleTap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"0.33"];
    display= app.staticTexts[@"0.33"];
    XCTAssertTrue(display.exists);
}
- (void)testDaynicPrecisionMul {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    
    XCUIElement *button = app.buttons[@"2"];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"."];
    [button2 tap];
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"*"] tap];
    [button tap];
    [button2 tap];
    [app.buttons[@"3"] doubleTap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"6.1978"];
    display= app.staticTexts[@"6.1978"];
    XCTAssertTrue(display.exists);
}
- (void)testDaynicPrecisionDiv {
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    
    XCUIElement *button = app.buttons[@"2"];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"."];
    [button2 tap];
    [app.buttons[@"6"] doubleTap];
    [app.buttons[@"/"] tap];
    [button tap];
    [button2 tap];
    [app.buttons[@"3"] doubleTap];
    [app.buttons[@"="] tap];
    XCUIElement *display= app.staticTexts[@"1.14163"];
    display= app.staticTexts[@"1.14163"];
    XCTAssertTrue(display.exists);
}
- (void)testSin
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"sin"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"-0.536573"];
    XCTAssertTrue(display.exists);
    
}

- (void)testCos
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"cos"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"0.843854"];
    XCTAssertTrue(display.exists);
    
}

- (void)testPlusandminus
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"+/-"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"-12"];
    XCTAssertTrue(display.exists);
    
}

- (void)testSqrt
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"sqrt"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"3.4641"];
    XCTAssertTrue(display.exists);
    
}
- (void)testPi
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    [app.buttons[@"(pi)"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"6.14159"];
    XCTAssertTrue(display.exists);
    
}
- (void)testFactorial
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    [app.buttons[@"4"] tap];
    [app.buttons[@"!"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"24"];
    XCTAssertTrue(display.exists);
    
    
}

- (void)testByDivsion
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    [app.buttons[@"5"] tap];
    [app.buttons[@"1/x"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"0.2"];
    XCTAssertTrue(display.exists);
    
    
}

- (void)testXsqare
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    [app.buttons[@"4"] tap];
    [app.buttons[@"x^2"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"16"];
    XCTAssertTrue(display.exists);
    
}

- (void)testXsqareY
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    [app.buttons[@"5"] tap];
    [app.buttons[@"x^y"] tap];
    [app.buttons[@"6"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"15625"];
    XCTAssertTrue(display.exists);
    
}

- (void)testParenthesis
{
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"("] tap];
    [app.buttons[@"x"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"5"] tap];
    [app.buttons[@")"] tap];
    
    XCUIElement *xButton = app.buttons[@"x="];
    [xButton tap];
    [app.alerts[@"Value for X"].collectionViews.buttons[@"OK"] tap];
    [app.buttons[@"6"] tap];
    [xButton tap];
    
    XCUIElement *display= app.staticTexts[@"11"];
    XCTAssertTrue(display.exists);
    
    
}

- (void)testPricisionSin
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"Increment"] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"sin"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"-0.537"];
    XCTAssertTrue(display.exists);
    
}
- (void)testPricisionCos
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"Increment"] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"cos"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"0.844"];
    XCTAssertTrue(display.exists);
    
}

- (void)testPricisionPlusandminus
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"Increment"] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"+/-"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"-12.000"];
    XCTAssertTrue(display.exists);
    
}

- (void)testPricisionSqrt
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"Increment"] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"sqrt"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"3.464"];
    XCTAssertTrue(display.exists);
    
}
- (void)testPricisionPi
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"Increment"] tap];
    
    
    [app.buttons[@"(pi)"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"6.142"];
    XCTAssertTrue(display.exists);
    
}
- (void)testPricisionFactorial
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"Increment"] tap];
    
    [app.buttons[@"4"] tap];
    [app.buttons[@"!"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"24.000"];
    XCTAssertTrue(display.exists);
    
    
}

- (void)testPricisionByDivsion
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"Increment"] tap];
    
    [app.buttons[@"5"] tap];
    [app.buttons[@"1/x"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"0.200"];
    XCTAssertTrue(display.exists);
    
    
}

- (void)testPricisionXsqare
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"Increment"] tap];
    
    [app.buttons[@"4"] tap];
    [app.buttons[@"x^2"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"16.000"];
    XCTAssertTrue(display.exists);
    
}

- (void)testPricisionXsqareY
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"Increment"] tap];
    
    [app.buttons[@"5"] tap];
    [app.buttons[@"x^y"] tap];
    [app.buttons[@"6"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"15625.000"];
    XCTAssertTrue(display.exists);
    
}

- (void)testPrecisionParenthesis
{
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app.buttons[@"Increment"] tap];
    [app.buttons[@"("] tap];
    [app.buttons[@"x"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"5"] tap];
    [app.buttons[@")"] tap];
    
    XCUIElement *xButton = app.buttons[@"x="];
    [xButton tap];
    [app.alerts[@"Value for X"].collectionViews.buttons[@"OK"] tap];
    [app.buttons[@"6"] tap];
    [xButton tap];
    
    XCUIElement *display= app.staticTexts[@"11.000"];
    XCTAssertTrue(display.exists);
    
    
}
- (void)testDynamicPrecisionSin
{
    
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"sin"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"-0.536573"];
    XCTAssertTrue(display.exists);
    
    
}

- (void)testDynamicPrecisionCos
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"cos"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"0.843854"];
    XCTAssertTrue(display.exists);
    
}

- (void)testDynamicPrecisionPlusandminus
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"+/-"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"-12"];
    XCTAssertTrue(display.exists);
    
}

- (void)testDynamicPrecisionSqrt
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"sqrt"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"3.4641"];
    XCTAssertTrue(display.exists);
    
}
- (void)testDynamicPrecisionPi
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [app.buttons[@"(pi)"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"3"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"6.14159"];
    XCTAssertTrue(display.exists);
    
}
- (void)testDynamicPrecisionFactorial
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [app.buttons[@"4"] tap];
    [app.buttons[@"!"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"24"];
    XCTAssertTrue(display.exists);
    
    
}

- (void)testDynamicPrecisionByDivsion
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [app.buttons[@"5"] tap];
    [app.buttons[@"1/x"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"0.2"];
    XCTAssertTrue(display.exists);
    
    
}

- (void)testDynamicPrecisionXsqare
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [app.buttons[@"4"] tap];
    [app.buttons[@"x^2"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"16"];
    XCTAssertTrue(display.exists);
    
}

- (void)testDynamicPrecisionXsqareY
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [app.buttons[@"5"] tap];
    [app.buttons[@"x^y"] tap];
    [app.buttons[@"6"] tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display= app.staticTexts[@"15625"];
    XCTAssertTrue(display.exists);
    
}

- (void)testDynamicPrecisionParenthesis
{
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"0"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:1] tap];
    [app.buttons[@"("] tap];
    [app.buttons[@"x"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"5"] tap];
    [app.buttons[@")"] tap];
    
    XCUIElement *xButton = app.buttons[@"x="];
    [xButton tap];
    [app.alerts[@"Value for X"].collectionViews.buttons[@"OK"] tap];
    [app.buttons[@"6"] tap];
    [xButton tap];
    
    XCUIElement *display= app.staticTexts[@"11"];
    XCTAssertTrue(display.exists);
    
    
}






@end

