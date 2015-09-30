//
//  smellTesting_Abdulrahman.m
//  smellTesting_Abdulrahman
//
//  Created by Senthil Arumugam, Dinesharumugam on 9/30/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface smellTesting_Abdulrahman : XCTestCase

@end

@implementation smellTesting_Abdulrahman

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

- (void)testSinCosOneByXPlusOrMinus {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button = app.buttons[@"3"];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"0"];
    [button2 tap];
    [app.buttons[@"sin"] tap];
    
    XCUIElement *cButton = app.buttons[@"C"];
    [cButton tap];
    [button tap];
    [button2 tap];
    [app.buttons[@"cos"] tap];
    [cButton tap];
    [button tap];
    [app.buttons[@"1/x"] tap];
    [cButton tap];
    [button tap];
    
    XCUIElement *button3 = app.buttons[@"+/-"];
    [button3 tap];
    [cButton tap];
    [app.buttons[@"5"] tap];
    [button3 tap];
    [app.buttons[@"="] tap];
    
    XCUIElement *display = app.staticTexts[@"-5"];
    XCTAssertTrue(display.exists);
}

- (void)testParanthesisAndX {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button4 = app.buttons[@"6"];
    [button4 tap];
    [app.buttons[@"*"] tap];
    
    XCUIElement *button3 = app.buttons[@"("];
    [button3 tap];
    
    XCUIElement *button = app.buttons[@"2"];
    [button tap];
    
    XCUIElement *button6 = app.buttons[@"+"];
    [button6 tap];
    [button tap];
    
    XCUIElement *button5 = app.buttons[@")"];
    [button5 tap];
    
    XCUIElement *button2 = app.buttons[@"="];
    [button2 tap];
    [app.buttons[@"C"] tap];
    [app.buttons[@"5"] tap];
    [app.buttons[@"x"] tap];
    [button2 tap];
    [button3 tap];
    [button4 tap];
    [button5 tap];
    [app.buttons[@"del"] tap];
    [button4 tap];
    [button6 tap];
    [app.buttons[@"3"] tap];
    [button5 tap];
    [button2 tap];
    [button2 tap];
    
    XCUIElement *display = app.staticTexts[@"12"];
    XCTAssertTrue(display.exists);
    

}
@end
