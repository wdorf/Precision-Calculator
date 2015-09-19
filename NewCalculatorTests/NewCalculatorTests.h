//
//  NewCalculatorTest.h
//  NewCalculator
//
//  Created by Moran, Jennifer on 9/19/15.
//  Copyright (c) 2015 Gannon University. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>

// Test-subject headers.
#import "AppDelegate.h"
#import "ViewController.h"

@interface NewCalculatorTests : XCTestCase {
@private
    AppDelegate    *app_delegate;
    ViewController *calc_view_controller;
    UIView             *calc_view;
    
}

@end
