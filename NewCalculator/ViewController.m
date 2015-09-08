//
//  ViewController.m
//  NewCalculator
//
//  Created by Diego Leal Togni on 10/3/14.
//  Copyright (c) 2014 Gannon University. All rights reserved.
//
// modified by Team IOS3

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()
@property (nonatomic) BOOL isInTheMiddleOfEnteringANumber;
@property (nonatomic) BOOL userPressedDot;
@property (nonatomic) BOOL isEqualPressed;
@property (nonatomic) BOOL isOperatorPressed;
@property (nonatomic) BOOL isSolvePressed;
@property (nonatomic, strong) CalculatorBrain *brain;
@property (nonatomic) NSString* operation;
@property (nonatomic) double operand;
@end

@implementation ViewController

@synthesize brain = _brain;
double memory = 0;

-(CalculatorBrain *)brain{
    if(!_brain) _brain = [[CalculatorBrain alloc]init];
    return _brain;
}

- (IBAction)numPressed:(UIButton*)sender {
    
    self.isOperatorPressed = NO;
    NSString* digit = [sender currentTitle];
    NSLog(@"User touched: %@",digit);
    
    //add text to numeric display, if isInTheMiddleOfEnteringANumber, treating when the user press Dot
    if (self.isInTheMiddleOfEnteringANumber) {
        if (![digit isEqualToString:@"."]) {
            self.numericDisplay.text = [self.numericDisplay.text stringByAppendingString:digit];
        } else if(!self.userPressedDot){
            self.numericDisplay.text = [self.numericDisplay.text stringByAppendingString:digit];
            self.userPressedDot = YES;
        }
        
    } else {//beginning of entering a number
        if (![digit isEqualToString:@"."]) {
            self.numericDisplay.text = digit;
        } else {
            self.numericDisplay.text = @"0.";
            self.userPressedDot = YES;
        }
        self.isInTheMiddleOfEnteringANumber = YES;
    }
    
}

- (IBAction)clear {
    self.isInTheMiddleOfEnteringANumber = NO;
    self.userPressedDot = NO;
    self.isEqualPressed = NO;
    self.isOperatorPressed = NO;
    self.numericDisplay.text = @"0";
    self.operation = @"";
    if ([self.dynamicPrecisionMode isOn]) {
        self.controlDecimalPlaces.value = 0;
    }else{
        self.controlDecimalPlaces.value = 2;
    }
    self.lblDecimalPlates.text = [NSString stringWithFormat:@"%d",[[NSNumber numberWithDouble:[self.controlDecimalPlaces value]] intValue]];
    self.operand = 0;
    self.equationDisplay.text = @"";
    self.brain.equation = [[NSMutableArray alloc] init];
}

- (IBAction)operationPressed:(UIButton *)sender {
    
    //round the value if fixedPrecisionMode is selected
    if (([self.fixedPrecisionMode isOn])) {
        self.numericDisplay.text = [self.brain formattedTextNumber:self.numericDisplay.text numberOfFractionDigits:[self.lblDecimalPlates.text intValue]];
    }
    
    //press enter (if is not pressed), save the number on the brain
    if (!self.isOperatorPressed) {
        if (!self.isEqualPressed) {
            [self equalPressed:sender];
        }
        self.operand = [self.numericDisplay.text doubleValue];
        self.operation = [sender currentTitle];
        self.isInTheMiddleOfEnteringANumber = NO;
        self.isOperatorPressed = YES;
        self.isEqualPressed = NO;
        self.userPressedDot = NO;
    }
    
    //update the precision, if dynamicMode is selected
    if ([self.dynamicPrecisionMode isOn]) {
        int decimalPlates = [self.brain decimalPlaces:self.numericDisplay.text];
        if (decimalPlates > [self.lblDecimalPlates.text intValue]) {
            self.lblDecimalPlates.text = [NSString stringWithFormat:@"%d",decimalPlates];
        }
    }
    
    //round the value if some precisionMode is selected
    if (([self.fixedPrecisionMode isOn])||([self.dynamicPrecisionMode isOn])) {
        self.numericDisplay.text = [self.brain formattedTextNumber:self.numericDisplay.text numberOfFractionDigits:[self.lblDecimalPlates.text intValue]];
    }
    
}

- (IBAction)quickOperationPressed:(UIButton *)sender {
    //round the value if fixedPrecisionMode is selected
    if (([self.fixedPrecisionMode isOn]))
    {
        self.numericDisplay.text = [self.brain formattedTextNumber:self.numericDisplay.text numberOfFractionDigits:[self.lblDecimalPlates.text intValue]];
    }
    
    //perfomr operation and print value
    self.numericDisplay.text = [NSString stringWithFormat:@"%1.6g",[self.brain performOperation:[sender currentTitle] firstOperand:self.operand secondOperand:[self.numericDisplay.text doubleValue]]];
    
    //update the precision, if dynamicMode is selected
    if ([self.dynamicPrecisionMode isOn]) {
        int decimalPlates = [self.brain decimalPlaces:self.numericDisplay.text];
        if (decimalPlates > [self.lblDecimalPlates.text intValue]) {
            self.lblDecimalPlates.text = [NSString stringWithFormat:@"%d",decimalPlates];
        }
    }
    
    //round the value if some precisionMode is selected
    if (([self.fixedPrecisionMode isOn])||([self.dynamicPrecisionMode isOn])) {
        self.numericDisplay.text = [self.brain formattedTextNumber:self.numericDisplay.text numberOfFractionDigits:[self.lblDecimalPlates.text intValue]];
    }
    
    self.isInTheMiddleOfEnteringANumber = NO;
    self.userPressedDot = NO;
    self.isEqualPressed = YES;
    self.isOperatorPressed = NO;
}


- (IBAction)equalPressed:(UIButton *)sender {
    
    if ([sender.currentTitle isEqualToString:@"="]) {
        [self equationDigitPressed:sender];
    }
    
    //round the value if some precisionMode is selected
    if (([self.fixedPrecisionMode isOn])) {
        self.numericDisplay.text = [self.brain formattedTextNumber:self.numericDisplay.text numberOfFractionDigits:[self.lblDecimalPlates.text intValue]];
    }
    
    //perform operation, print number and save the second number in a temp var
    double numTemp = [self.numericDisplay.text doubleValue];
    self.numericDisplay.text = [NSString stringWithFormat:@"%1.6g",[self.brain performOperation:self.operation firstOperand:self.operand secondOperand:[self.numericDisplay.text doubleValue]]];
    
    //update the precision, if dynamicMode is selected
    if ([self.dynamicPrecisionMode isOn]) {
        int decimalPlates = [self.brain decimalPlaces:self.numericDisplay.text];
        if (decimalPlates > [self.lblDecimalPlates.text intValue]) {
            self.lblDecimalPlates.text = [NSString stringWithFormat:@"%d",decimalPlates];
        }
    }
    //round the value if some precisionMode is selected
    if (([self.fixedPrecisionMode isOn])||([self.dynamicPrecisionMode isOn])) {
        self.numericDisplay.text = [self.brain formattedTextNumber:self.numericDisplay.text numberOfFractionDigits:[self.lblDecimalPlates.text intValue]];
    }
    
    //send the value to the brain if equal is pressed for the first time
    if (self.isInTheMiddleOfEnteringANumber) {
        self.operand = numTemp;
        //[self.brain pushOperand:numTemp];
    }
    
    self.isInTheMiddleOfEnteringANumber = NO;
    self.userPressedDot = NO;
    self.isEqualPressed = YES;
    self.isOperatorPressed = NO;
}

- (IBAction)piPressed {
    self.numericDisplay.text = @"3.141592";
    self.isInTheMiddleOfEnteringANumber = NO;
    self.userPressedDot = NO;
    self.isEqualPressed = NO;
    self.isOperatorPressed = NO;
}

- (IBAction)memoryManager:(UIButton *)sender {
    if ([[sender currentTitle] isEqualToString:@"M+"]) {
        memory += [self.numericDisplay.text doubleValue];
        self.isInTheMiddleOfEnteringANumber = NO;
        self.userPressedDot = NO;
        self.isEqualPressed = NO;
        self.isOperatorPressed = NO;
    }else if ([[sender currentTitle]isEqualToString:@"M-"]){
        memory -= [self.numericDisplay.text doubleValue];
        self.isInTheMiddleOfEnteringANumber = NO;
        self.userPressedDot = NO;
        self.isEqualPressed = NO;
        self.isOperatorPressed = NO;
    }else if ([[sender currentTitle] isEqualToString:@"MR"]){
        self.numericDisplay.text = [NSString stringWithFormat:@"%1.6g",memory];
        self.isInTheMiddleOfEnteringANumber = NO;
        self.userPressedDot = NO;
        self.isEqualPressed = NO;
        self.isOperatorPressed = NO;
    }else if ([[sender currentTitle] isEqualToString:@"MC"]){
        memory = 0;
    }
}

- (IBAction)chgFixedPrecisionMode:(UISwitch *)sender {
    if ([sender isOn]) {
        [self.controlDecimalPlaces setHidden:NO];
        [self.dynamicPrecisionMode setOn:NO];
        [self.lblDecimalPlates setHidden:NO];
        [self.lblAuxiliar setHidden:NO];
        self.controlDecimalPlaces.value = 2;
    }else {
        [self.controlDecimalPlaces setHidden:YES];
        [self.lblDecimalPlates setHidden:YES];
        [self.lblAuxiliar setHidden:YES];
        self.controlDecimalPlaces.value = 0;
    }
    self.lblDecimalPlates.text = [NSString stringWithFormat:@"%d",[[NSNumber numberWithDouble:self.controlDecimalPlaces.value] intValue]];
}

- (IBAction)chgDynamicPrecisionMode:(UISwitch *)sender {
    if ([sender isOn]){
        [self.fixedPrecisionMode setOn:NO];
        [self.controlDecimalPlaces setHidden:YES];
        [self.lblDecimalPlates setHidden:NO];
        [self.lblAuxiliar setHidden:NO];
        self.controlDecimalPlaces.value = 0;
    }else{
        [self.lblDecimalPlates setHidden:YES];
        [self.lblAuxiliar setHidden:YES];
        self.controlDecimalPlaces.value = 2;
    }
    self.lblDecimalPlates.text = [NSString stringWithFormat:@"%d",[[NSNumber numberWithDouble:self.controlDecimalPlaces.value] intValue]];
}

- (IBAction)chgPrecision:(UIStepper *)sender {
    self.lblDecimalPlates.text = [NSString stringWithFormat:@"%d",[[NSNumber numberWithDouble:[(UIStepper*)sender value]] intValue]];
}

- (IBAction)equationDigitPressed:(UIButton *)sender {
    if ([[sender currentTitle] isEqualToString:@"1/x"]) {
        self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:@"1/"];
        self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:self.numericDisplay.text];
        [self.brain pushEquationElement:[NSNumber numberWithDouble:1]];
        [self.brain pushEquationElement:@"/"];
        [self.brain pushEquationElement:[NSNumber numberWithDouble:[self.numericDisplay.text doubleValue]]];
    }else if ([[sender currentTitle] isEqualToString:@"x^2"]){
        if (!self.isEqualPressed) self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:self.numericDisplay.text];
        self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:@"^2"];
        if (!self.isEqualPressed) [self.brain pushEquationElement:[NSNumber numberWithDouble:[self.numericDisplay.text doubleValue]]];
        [self.brain pushEquationElement:@"^"];
        [self.brain pushEquationElement:[NSNumber numberWithDouble:2]];
    }else if ([[sender currentTitle] isEqualToString:@"x^y"]){
        if (!self.isEqualPressed) self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:self.numericDisplay.text];
        self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:@"^"];
        if (!self.isEqualPressed) [self.brain pushEquationElement:[NSNumber numberWithDouble:[self.numericDisplay.text doubleValue]]];
        [self.brain pushEquationElement:@"^"];
    }else if ([@[@"sin",@"cos",@"sqrt"] containsObject:[sender currentTitle]]){
        self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:sender.currentTitle];
        self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:self.numericDisplay.text];
        [self.brain pushEquationElement:sender.currentTitle];
        [self.brain pushEquationElement:[NSNumber numberWithDouble:[self.numericDisplay.text doubleValue]]];
    }else if ([@[@"*",@"/",@"+",@"-"] containsObject:[sender currentTitle]]){
        if (!self.isEqualPressed) self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:self.numericDisplay.text];
        self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:sender.currentTitle];
        if (!self.isEqualPressed) [self.brain pushEquationElement:[NSNumber numberWithDouble:[self.numericDisplay.text doubleValue]]];
        [self.brain pushEquationElement:sender.currentTitle];
    }else if([@[@"x",@"("] containsObject:[sender currentTitle]]){
        self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:[sender currentTitle]];
        [self.brain pushEquationElement:sender.currentTitle];
        if ([sender.currentTitle isEqualToString:@"x"])self.isEqualPressed = YES;
    }else if([sender.currentTitle isEqualToString:@"="]){
        if (![[self.brain.equation lastObject] isKindOfClass:[NSNumber class]]){
            self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:self.numericDisplay.text];
            [self.brain pushEquationElement:[NSNumber numberWithDouble:[self.numericDisplay.text doubleValue]]];
        }
    }else if ([[sender currentTitle] isEqualToString:@"del"]){
        [self.brain.equation removeLastObject];
        self.equationDisplay.text = self.brain.displayEquation;
        self.isInTheMiddleOfEnteringANumber = NO;
        self.isEqualPressed = YES;
    }else {
        if (!self.isEqualPressed) self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:self.numericDisplay.text];
        self.equationDisplay.text = [self.equationDisplay.text stringByAppendingString:sender.currentTitle];
        if (!self.isEqualPressed) [self.brain pushEquationElement:[NSNumber numberWithDouble:[self.numericDisplay.text doubleValue]]];
        [self.brain pushEquationElement:sender.currentTitle];
    }
}

- (IBAction)atributeValueForX:(UIButton *)sender {
    if (!self.isSolvePressed) {
        self.isInTheMiddleOfEnteringANumber = NO;
        self.userPressedDot = NO;
        self.isEqualPressed = NO;
        self.isOperatorPressed = NO;
        self.numericDisplay.text = @"0";
        self.operation = @"";
        if ([self.brain.equation containsObject:@"x"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Value for X" message:@"Type the value for X on the numeric display and press (x=) again to solve the equation" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            self.isSolvePressed = YES;
        }else{
            [self.brain formatEquation:self.numericDisplay.text];
            double result = [self.brain solveEquation];
            self.equationDisplay.text = [self.brain displayEquation];
            self.numericDisplay.text = [NSString stringWithFormat:@"%g",result];
            self.isSolvePressed = NO;
            [self equalPressed:sender];
            
        }
    }else {
        [self.brain formatEquation:self.numericDisplay.text];
        double result = [self.brain solveEquation];
        self.equationDisplay.text = [self.brain displayEquation];
        self.numericDisplay.text = [NSString stringWithFormat:@"%g",result];
        self.isSolvePressed = NO;
        [self equalPressed:sender];
    }
}

@end
