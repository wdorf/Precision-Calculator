//
//  ViewController.h
//  NewCalculator
//
//  Created by Diego Leal Togni on 10/3/14.
//  Copyright (c) 2014 Gannon University. All rights reserved.
//
// modified by Team IOS3

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *numericDisplay;
@property (weak, nonatomic) IBOutlet UISwitch *fixedPrecisionMode;
@property (weak, nonatomic) IBOutlet UILabel *lblDecimalPlates;
@property (weak, nonatomic) IBOutlet UIStepper *controlDecimalPlaces;
@property (weak, nonatomic) IBOutlet UISwitch *dynamicPrecisionMode;
@property (weak, nonatomic) IBOutlet UILabel *lblAuxiliar;

@property (weak, nonatomic) IBOutlet UILabel *equationDisplay;

@end

