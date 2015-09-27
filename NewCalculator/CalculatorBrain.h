//Group 9 
//  CalculatorBrain.h
//  NewCalculator sss
//
//  Created by Diego Leal Togni on 10/3/14.
//  Copyright (c) 2014 Gannon University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(double)performOperation:(NSString *)operation firstOperand:(double)firstNumber secondOperand:(double)secondNumber;
-(NSString *)formattedTextNumber:(NSString*)text numberOfFractionDigits:(int)precision;
-(int)decimalPlaces:(NSString *)number;
-(void)pushEquationElement:(id)element;

-(void)formatEquation:(NSString *)valueForX;
-(double)solveEquation;
-(NSString*)displayEquation;

@property (nonatomic) NSMutableArray *equation;

@property (nonatomic,readonly) double operand;

@end
