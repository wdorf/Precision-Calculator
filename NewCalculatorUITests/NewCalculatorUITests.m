//
//  NewCalculatorUITests.m
//  NewCalculatorUITests
//
//  Created by Sophia Rodriguez on 9/29/15.
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

/*- (void)testAddition{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"6"] tap];
    
    XCUIElement *button = app.buttons[@"+"];
    [button tap];
    [app.buttons[@"2"] tap];
    
    XCUIElement *button2 = app.buttons[@"="];
    [button2 tap];
    
    //assert 1
    XCUIElement *display = app.staticTexts[@"8"];
    XCTAssertTrue(display.exists);
    
    
    XCUIElement *cButton = app.buttons[@"C"];
    [cButton tap];
    
    XCUIElement *button3 = app.buttons[@"1"];
    [button3 tap];
    
    XCUIElement *button4 = app.buttons[@"0"];
    [button4 tap];
    
    XCUIElement *button5 = app.buttons[@"+/-"];
    [button5 tap];
    [button tap];
    [app.buttons[@"3"] tap];
    [button2 tap];
    
    //assert 2
    display = app.staticTexts[@"-7"];
    XCTAssertTrue(display.exists);
    
    [cButton tap];
    [button3 tap];
    [button4 tap];
    [button5 tap];
    [button tap];
    [button3 tap];
    [app.buttons[@"5"] tap];
    [button2 tap];
    //assert 3
    display = app.staticTexts[@"5"];
    XCTAssertTrue(display.exists);
}*/

-(void)testSubtraction{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"9"] tap];
    
    XCUIElement *button = app.buttons[@"."];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"5"];
    [button2 tap];
    
    XCUIElement *button3 = app.buttons[@"-"];
    [button3 tap];
    [app.buttons[@"4"] tap];
    [button tap];
    [button2 tap];
    
    XCUIElement *button5 = app.buttons[@"="];
    [button5 tap];
    //assert 1
    XCUIElement *display = app.staticTexts[@"5"];
    XCTAssertTrue(display.exists);
    
    XCUIElement *cButton = app.buttons[@"C"];
    [cButton tap];
    
    XCUIElement *button6 = app.buttons[@"2"];
    [button6 tap];
    
    XCUIElement *button4 = app.buttons[@"1"];
    [button4 tap];
    [app.buttons[@"+/-"] tap];
    [button3 tap];
    [button4 tap];
    
    XCUIElement *button7 = app.buttons[@"0"];
    [button7 tap];
    [button5 tap];
    //assert 2
    display = app.staticTexts[@"-31"];
    XCTAssertTrue(display.exists);
    
    [cButton tap];
    [button4 tap];
    [app.buttons[@"7"] tap];
    [button3 tap];
    [button6 tap];
    [button7 tap];
    [button5 tap];
    //assert 3
    display = app.staticTexts[@"-3"];
    XCTAssertTrue(display.exists);
}

@end
