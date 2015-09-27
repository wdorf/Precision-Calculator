//
//  ViewController.h
//  NewCalculator
//
//  Created by Diego Leal Togni on 10/3/14.
//  Copyright (c) 2014 Gannon University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *numericDisplay;
@property (weak, nonatomic) IBOutlet UISwitch *fixedPrecisionMode;
@property (weak, nonatomic) IBOutlet UILabel *lblDecimalPlates;
@property (weak, nonatomic) IBOutlet UIStepper *controlDecimalPlaces;
@property (weak, nonatomic) IBOutlet UISwitch *dynamicPrecisionMode;
@property (weak, nonatomic) IBOutlet UILabel *lblAuxiliar;

@property (weak, nonatomic) IBOutlet UILabel *equationDisplay;

- (IBAction)numPressed:(UIButton*)sender;
- (IBAction)clear;
- (IBAction)operationPressed:(UIButton *)sender;
- (IBAction)quickOperationPressed:(UIButton *)sender ;
- (IBAction)equalPressed:(UIButton *)sender;
- (IBAction)piPressed;
- (IBAction)memoryManager:(UIButton *)sender;
- (IBAction)chgFixedPrecisionMode:(UISwitch *)sender;
- (IBAction)chgDynamicPrecisionMode:(UISwitch *)sender;
- (IBAction)chgPrecision:(UIStepper *)sender;
- (IBAction)equationDigitPressed:(UIButton *)sender;
- (IBAction)inversePressed:(UIButton *)sender;
- (IBAction)powerActionPressed:(UIButton *)sender;
- (IBAction)delPressed:(UIButton *)sender;
- (IBAction)atributeValueForX:(UIButton *)sender;

@end

