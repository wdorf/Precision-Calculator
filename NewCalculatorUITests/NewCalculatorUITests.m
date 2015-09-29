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

- (void)testAddition{
    
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
}

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

-(void)testMultiplication{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button = app.buttons[@"7"];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"*"];
    [button2 tap];
    
    XCUIElement *button3 = app.buttons[@"2"];
    [button3 tap];
    
    XCUIElement *button4 = app.buttons[@"."];
    [button4 tap];
    
    XCUIElement *button5 = app.buttons[@"4"];
    [button5 tap];
    
    XCUIElement *button6 = app.buttons[@"3"];
    [button6 tap];
    
    XCUIElement *button8 = app.buttons[@"="];
    [button8 tap];
    //assert 1
    XCUIElement *display = app.staticTexts[@"17.01"];
    XCTAssertTrue(display.exists);
    
    XCUIElement *cButton = app.buttons[@"C"];
    [cButton tap];
    [button tap];
    
    XCUIElement *button7 = app.buttons[@"+/-"];
    [button7 tap];
    [button2 tap];
    [button3 tap];
    [button4 tap];
    [button5 tap];
    [button6 tap];
    [button7 tap];
    [button8 tap];
    
    //assert 2
    display = app.staticTexts[@"17.01"];
    XCTAssertTrue(display.exists);
    
    [cButton tap];
    [app.buttons[@"6"] tap];
    [button7 tap];
    [button2 tap];
    [app.buttons[@"5"] tap];
    [button7 tap];
    [button8 tap];
    //assert 3
    display = app.staticTexts[@"30"];
    XCTAssertTrue(display.exists);
}

-(void)testDivision{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button = app.buttons[@"1"];
    [button tap];
    [app.buttons[@"2"] tap];
    
    XCUIElement *button4 = app.buttons[@"6"];
    [button4 tap];
    
    XCUIElement *button2 = app.buttons[@"/"];
    [button2 tap];
    [button tap];
    
    XCUIElement *button7 = app.buttons[@"3"];
    [button7 tap];
    
    XCUIElement *button3 = app.buttons[@"="];
    [button3 tap];
    
    //assert 1
    XCUIElement *display = app.staticTexts[@"9.69231"];
    XCTAssertTrue(display.exists);
    
    XCUIElement *cButton = app.buttons[@"C"];
    [cButton tap];
    [button tap];
    
    XCUIElement *button9 = app.buttons[@"5"];
    [button9 tap];
    [button2 tap];
    
    XCUIElement *button10 = app.buttons[@"0"];
    [button10 tap];
    [button3 tap];
    //assert 2
    display = app.staticTexts[@"0"];
    XCTAssertTrue(display.exists);
    
    [cButton tap];
    [button4 tap];
    
    XCUIElement *button5 = app.buttons[@"4"];
    [button5 tap];
    
    XCUIElement *button6 = app.buttons[@"+/-"];
    [button6 tap];
    [button2 tap];
    [button5 tap];
    [button6 tap];
    [button3 tap];
    //assert 3
    display = app.staticTexts[@"16"];
    XCTAssertTrue(display.exists);
    
    [cButton tap];
    [button tap];
    
    XCUIElement *button8 = app.buttons[@"7"];
    [button8 tap];
    [button7 tap];
    [button6 tap];
    [button2 tap];
    [button8 tap];
    [button3 tap];
    //assert 4
    display = app.staticTexts[@"-24.7143"];
    XCTAssertTrue(display.exists);
    
    [cButton tap];
    [button tap];
    [button9 tap];
    [button6 tap];
    [button2 tap];
    [button10 tap];
    [button3 tap];
    //assert 5
    display = app.staticTexts[@"0"];
    XCTAssertTrue(display.exists);
    
}

-(void)testSqRt{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"2"] tap];
    [app.buttons[@"3"] tap];
    
    XCUIElement *sqrtButton = app.buttons[@"sqrt"];
    [sqrtButton tap];
    //assert 1
    XCUIElement *display = app.staticTexts[@"4.79583"];
    XCTAssertTrue(display.exists);
    
    [app.buttons[@"C"] tap];
    [app.buttons[@"5"] tap];
    [app.buttons[@"+/-"] tap];
    [sqrtButton tap];
    display = app.staticTexts[@"nan"];
    XCTAssertTrue(display.exists);
    
    
    XCUIApplication *app2 = [[XCUIApplication alloc] init];
    [[[[[app2.otherElements containingType:XCUIElementTypeStaticText identifier:@"Decimals places:"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Teste"] elementBoundByIndex:0] tap];
    [app2.buttons[@"Increment"] tap];
    [app2.buttons[@"2"] tap];
    [app2.buttons[@"3"] tap];
    [app2.buttons[@"sqrt"] tap];
    display = app.staticTexts[@"4.796"];
    XCTAssertTrue(display.exists);
    
}

-(void)testSquare{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"1"] tap];
    [app.buttons[@"5"] tap];
    
    XCUIElement *x2Button = app.buttons[@"x^2"];
    [x2Button tap];
    //assert 1
    XCUIElement *display = app.staticTexts[@"225"];
    XCTAssertTrue(display.exists);
    
    [app.buttons[@"C"] tap];
    [app.buttons[@"7"] tap];
    [app.buttons[@"+/-"] tap];
    [x2Button tap];
    display = app.staticTexts[@"49"];
    XCTAssertTrue(display.exists);
    
    
}

-(void)testPower{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button = app.buttons[@"2"];
    [button tap];
    
    XCUIElement *xYButton = app.buttons[@"x^y"];
    [xYButton tap];
    [app.buttons[@"8"] tap];
    
    XCUIElement *button2 = app.buttons[@"="];
    [button2 tap];
    //assert 1
    XCUIElement *display = app.staticTexts[@"256"];
    XCTAssertTrue(display.exists);
    
    [app.buttons[@"C"] tap];
    [button tap];
    [app.buttons[@"+/-"] tap];
    [xYButton tap];
    [app.buttons[@"5"] tap];
    [button2 tap];
    //assert 2
    display = app.staticTexts[@"-32"];
    XCTAssertTrue(display.exists);
    
}

-(void)testOneOver{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"5"] tap];
    [app.buttons[@"6"] tap];
    
    XCUIElement *button = app.buttons[@"1/x"];
    [button tap];
    //assert 1
    XCUIElement *display = app.staticTexts[@"0.0178571"];
    XCTAssertTrue(display.exists);
    
    [app.buttons[@"C"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"+/-"] tap];
    [button tap];
    //assert 2
    display = app.staticTexts[@"-0.047619"];
    XCTAssertTrue(display.exists);
}

-(void)testFactorial{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"6"] tap];
    
    XCUIElement *button = app.buttons[@"!"];
    [button tap];
    //assert 1
    XCUIElement *display = app.staticTexts[@"720"];
    XCTAssertTrue(display.exists);
    
    [app.buttons[@"C"] tap];
    [app.buttons[@"4"] tap];
    [app.buttons[@"+/-"] tap];
    [button tap];
    //assert 2
    display = app.staticTexts[@"-4"];
    XCTAssertTrue(display.exists);
}

-(void)testParenthesis{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button = app.buttons[@"("];
    [button tap];
    [app.buttons[@"6"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"8"] tap];
    
    XCUIElement *button3 = app.buttons[@")"];
    [button3 tap];
    
    XCUIElement *button4 = app.buttons[@"*"];
    [button4 tap];
    
    XCUIElement *button2 = app.buttons[@"5"];
    [button2 tap];
    
    XCUIElement *button5 = app.buttons[@"="];
    [button5 tap];
    //assert 1
    XCUIElement *display = app.staticTexts[@"70"];
    XCTAssertTrue(display.exists);
    
    [app.buttons[@"C"] tap];
    [button tap];
    [button2 tap];
    [app.buttons[@"+/-"] tap];
    [app.buttons[@"-"] tap];
    [app.buttons[@"7"] tap];
    [button3 tap];
    [button4 tap];
    [button2 tap];
    [button5 tap];
    //assert 2
    display = app.staticTexts[@"-60"];
    XCTAssertTrue(display.exists);
    
    
}

-(void)testMPlus{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"5"] tap];
    
    XCUIElement *mButton = app.buttons[@"M+"];
    [mButton tap];
    [app.buttons[@"9"] tap];
    [mButton tap];
    
    XCUIElement *mrButton = app.buttons[@"MR"];
    [mrButton tap];
    //assert 1
    XCUIElement *display = app.staticTexts[@"14"];
    XCTAssertTrue(display.exists);
    
    [app.buttons[@"C"] tap];
    [app.buttons[@"MC"] tap];
    [mrButton tap];
    //assert 2
    display = app.staticTexts[@"0"];
    XCTAssertTrue(display.exists);
    
}

-(void)testMMinus{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"8"] tap];
    
    XCUIElement *mButton = app.buttons[@"M-"];
    [mButton tap];
    [app.buttons[@"5"] tap];
    [mButton tap];
    [app.buttons[@"MR"] tap];
    XCUIElement *display = app.staticTexts[@"-13"];
    XCTAssertTrue(display.exists);
}

-(void)testSin{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"1"] tap];
    [app.buttons[@"sin"] tap];
    XCUIElement *display = app.staticTexts[@"0.841471"];
    XCTAssertTrue(display.exists);
}

-(void)testCos{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"(pi)"] tap];
    [app.buttons[@"cos"] tap];
    XCUIElement *display = app.staticTexts[@"-1"];
    XCTAssertTrue(display.exists);
}



@end
