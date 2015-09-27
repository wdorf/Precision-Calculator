//
//  NewCalculatorUITests.m
//  NewCalculatorUITests
//
//  Created by Alotaibi, Waleed N on 9/25/15.
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
//-(XCUIElement *) getDisplayElement{
//    return (display)
//}
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
@end