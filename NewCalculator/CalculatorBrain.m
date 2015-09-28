//
//  CalculatorBrain.m
//  NewCalculator
//
//  Created by Diego Leal Togni on 10/3/14..
//  Copyright (c) 2014 Gannon University. All rights reserved.
//  modified by KW

#import "CalculatorBrain.h"

@interface CalculatorBrain ()
@property (nonatomic) double operand;
@end


@implementation CalculatorBrain

@synthesize equation = _equation;

-(NSMutableArray *)equation{
    if (!_equation) {
        _equation = [[NSMutableArray alloc]init];
    }
    return _equation;
}

double factorial(double n)
{
    if (n <= 0) {
        return 1;
    } else {
        return n * factorial (n - 1);
    }
}

-(double)performOperation:(NSString *)operation firstOperand:(double)firstNumber secondOperand:(double)secondNumber{
    double result = secondNumber;
    
    NSString *operators = operation;
    NSArray *items = @[@"0", @"+",@"*",@"/",@"-",@"sin",@"cos", @"sqrt",@"+/-",@"!",@"1/x",@"x^2",@"x^y"];
    long item = [items indexOfObject:operators];
    
    
    switch (item){
            
        case 1:
            operators = @"+";
            result = firstNumber + secondNumber;
            break;
            
        case 2:
            operators = @"*";
            result = firstNumber * secondNumber;
            break;
            
        case 3:
            operators = @"/";
            result = firstNumber / secondNumber;
            break;
            
        case 4:
            operators = @"-";
            result = firstNumber - secondNumber;
            break;
            
        case 5:
            operators = @"sin";
            result = sin(secondNumber);
            break;
            
        case 6:
            operators = @"cos";
            result = cos(secondNumber);
            break;
            
        case 7:
            operators = @"sqrt";
            result = sqrt(secondNumber);
            break;
            
        case 8:
            operators = @"+/-";
            result = secondNumber*-1;
            break;
            
        case 9:
            operators = @"!";
            if (secondNumber>=0) result = factorial(secondNumber);
            break;
            
        case 10:
            operators = @"1/x";
            if (secondNumber) result = (1/secondNumber);
            break;
            
        case 11:
            operators = @"x^2";
            double base = secondNumber;
            result = pow(base, 2);
            break;
            
        case 12:
            operators = @"x^y";
            result = pow(firstNumber, secondNumber);
            break;
            
        default:
            break;
            
    }
    NSLog(@"Calc:\nNum1: %g\nOper: %@\nNum2: %g\nResult: %g",firstNumber,operation,secondNumber,result);
    
    return result;
}


-(NSString*)formattedTextNumber:(NSString*)text numberOfFractionDigits:(int)precision{
    double num = [text doubleValue];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.maximumFractionDigits = precision;
    formatter.minimumFractionDigits = precision;
    formatter.minimumIntegerDigits = 1;
    return [formatter stringFromNumber:@(num)];
}

-(int)decimalPlaces:(NSString *)number{
    double newNum = [number doubleValue];
    double decimalPortion = newNum - floor(newNum);
    int decimalPlaces = (int)[[NSString stringWithFormat:@"%1.6g",decimalPortion] length] -2;
    return decimalPlaces;
}

-(NSString*)displayEquation{
    NSMutableString* equationString = [[NSMutableString alloc] init];
    for (id component in _equation) {
        equationString = [NSMutableString stringWithString:[equationString stringByAppendingString:[component description]]];
    }
    return equationString;
}

-(void)pushEquationElement:(id)element{
    [self.equation addObject:element];
    NSLog(@"Equation:");
    NSLog(@"%@", [self displayEquation]);
}

-(void)formatEquation:(NSString *)valueForX{
    NSNumber *number = [NSNumber numberWithDouble:[valueForX doubleValue]];
    
    //substitute all the x's for valueForX
    for (int i=0; i < _equation.count; i++) {
        id currentComponent = [_equation objectAtIndex:i];
        if ([currentComponent isKindOfClass:[NSString class]]) {
            if ([currentComponent isEqualToString:@"x"]) {
                [_equation removeObjectAtIndex:i];
                [_equation insertObject:@")" atIndex:i];
                [_equation insertObject:number atIndex:i];
                [_equation insertObject:@"(" atIndex:i];
            }
        }
    }
}

void recursiveFactorial(int i, NSMutableArray *tempEquation, CalculatorBrain *object) {
    id currentComponent = [tempEquation objectAtIndex:i];
    if ([currentComponent isKindOfClass:[NSNumber class]]) {
        id nextComponent = [tempEquation objectAtIndex:i+1];
        if ([nextComponent isKindOfClass:[NSString class]]) {
            if ([nextComponent isEqualToString:@"!"]) {
                double result = [object performOperation:@"!" firstOperand:0 secondOperand:[currentComponent doubleValue]];
                [tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:i];
                [tempEquation removeObjectAtIndex:i+1];
                [tempEquation removeObjectAtIndex:i+1];
            }
        }
    }
}

void recursiveTrig(int *i_p, NSMutableArray *tempEquation, CalculatorBrain *object) {
    id currentComponent = [tempEquation objectAtIndex:*i_p];
    if ([currentComponent isKindOfClass:[NSNumber class]]) {
        id previousComponent = [tempEquation objectAtIndex:*i_p-1];
        if ([previousComponent isKindOfClass:[NSString class]]) {
            if ([@[@"sin", @"cos"] containsObject:previousComponent]) {
                double result = [object performOperation:previousComponent firstOperand:0 secondOperand:[currentComponent doubleValue]];
                [tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:*i_p];
                [tempEquation removeObjectAtIndex:*i_p+1];
                [tempEquation removeObjectAtIndex:*i_p-1];
                (*i_p)--;
            }
        }
    }
}

void recursiveSquareRoot(int *i_p, NSMutableArray *tempEquation, CalculatorBrain *object) {
    id currentComponent = [tempEquation objectAtIndex:*i_p];
    
    if ([currentComponent isKindOfClass:[NSNumber class]]) {
        id previousComponent = [tempEquation objectAtIndex:*i_p-1];
        if ( [previousComponent isKindOfClass:[NSString class]] ) {
            if ([previousComponent isEqualToString:@"sqrt"]) {
                double result = [object performOperation:previousComponent firstOperand:0 secondOperand:[currentComponent doubleValue]];
                [tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:*i_p];
                [tempEquation removeObjectAtIndex:*i_p+1];
                [tempEquation removeObjectAtIndex:*i_p-1];
                (*i_p)--;
            }
        }
    }
}

void recursiveExponential(int i, NSMutableArray *tempEquation, CalculatorBrain *object) {
    id currentComponent = [tempEquation objectAtIndex:i];
    
    if ([currentComponent isKindOfClass:[NSNumber class]]) {
        id nextComponent = [tempEquation objectAtIndex:i+1];
        if ([nextComponent isKindOfClass:[NSString class]]) {
            if ([nextComponent isEqualToString:@"^"]) {
                id nextNextComponent = [tempEquation objectAtIndex:i+2];
                if ([nextNextComponent isKindOfClass:[NSNumber class]]) {
                    double result = [object performOperation:@"x^y" firstOperand:[currentComponent doubleValue] secondOperand:[nextNextComponent doubleValue]];
                    [tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:i];
                    [tempEquation removeObjectAtIndex:i+1];
                    [tempEquation removeObjectAtIndex:i+1];
                    [tempEquation removeObjectAtIndex:i+1];
                }
            }
        }
    }
}

void recursiveMultiplicationDivision(int i, NSMutableArray *tempEquation, CalculatorBrain *object) {
    id currentComponent = [tempEquation objectAtIndex:i];
    
    if ([currentComponent isKindOfClass:[NSNumber class]]) {
        id nextComponent = [tempEquation objectAtIndex:i+1];
        if ([nextComponent isKindOfClass:[NSString class]]) {
            if ([@[@"*",@"/"] containsObject:nextComponent]) {
                id nextNextComponent = [tempEquation objectAtIndex:i+2];
                if ([nextNextComponent isKindOfClass:[NSNumber class]]) {
                    double result = [object performOperation:nextComponent firstOperand:[currentComponent doubleValue] secondOperand:[nextNextComponent doubleValue]];
                    [tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:i];
                    [tempEquation removeObjectAtIndex:i+1];
                    [tempEquation removeObjectAtIndex:i+1];
                    [tempEquation removeObjectAtIndex:i+1];
                }
            }
        }
    }
}

void recursiveAddSubtract(int i, NSMutableArray *tempEquation, CalculatorBrain *object) {
    id currentComponent = [tempEquation objectAtIndex:i];
    
    if ([currentComponent isKindOfClass:[NSNumber class]]) {
        id nextComponent = [tempEquation objectAtIndex:i+1];
        if ([nextComponent isKindOfClass:[NSString class]]) {
            if ([@[@"+",@"-"] containsObject:nextComponent]) {
                id nextNextComponent = [tempEquation objectAtIndex:i+2];
                if ([nextNextComponent isKindOfClass:[NSNumber class]]) {
                    double result = [object performOperation:nextComponent firstOperand:[currentComponent doubleValue] secondOperand:[nextNextComponent doubleValue]];
                    [tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:i];
                    [tempEquation removeObjectAtIndex:i+1];
                    [tempEquation removeObjectAtIndex:i+1];
                    [tempEquation removeObjectAtIndex:i+1];
                }
            }
        }
    }
}

-(NSMutableArray *)solveEquationRecursive:(NSMutableArray *)equation{
    
    NSMutableArray* tempEquation = [NSMutableArray arrayWithArray:equation];
    
    BOOL isEquationSolved = NO;
    while (!isEquationSolved) {
        
        while ([tempEquation containsObject:@"("]) {
            
            //searching for numbers surrounded by parentheses
            for (int i=1; i < (tempEquation.count-1); i++) {
                id currentComponent = [tempEquation objectAtIndex:i];
                if ([currentComponent isKindOfClass:[NSNumber class]]) {
                    id nextComponent = [tempEquation objectAtIndex:i+1];
                    id previousComponent = [tempEquation objectAtIndex:i-1];
                    if ( ([nextComponent isKindOfClass:[NSString class]]) && ([previousComponent isKindOfClass:[NSString class]]) ) {
                        if ( ([previousComponent isEqualToString:@"("]) && ([nextComponent isEqualToString:@")"]) ) {
                            [tempEquation removeObjectAtIndex:i+1];
                            [tempEquation removeObjectAtIndex:i-1];
                            i--;
                        }
                    }
                }
            }
            
            //add * signal where necessary
            for (int i=0; i < (tempEquation.count-1); i++) {
                id currentComponent = [tempEquation objectAtIndex:i];
                
                if ([currentComponent isKindOfClass:[NSNumber class]]) {
                    id nextComponent = [tempEquation objectAtIndex:i+1];
                    if ([nextComponent isKindOfClass:[NSNumber class]]) {
                        [tempEquation insertObject:@"*" atIndex:i+1];
                    }
                }
            }
            
            //searching for subEquation inside the equations
            int closingParenthesesPosition = 0;
            int openingParenthesesPosition = 0;
            int i= 0;
            BOOL foundClosingParentheses = NO;
            BOOL foundOpeningParentheses = NO;
            
            //identifing the position of the most intern parentheses
            while ((i < tempEquation.count)&&(!foundOpeningParentheses)) {
                id currentElement = [tempEquation objectAtIndex:i];
                if (!foundClosingParentheses) {
                    if ([currentElement isKindOfClass:[NSString class]]) {
                        if ([currentElement isEqualToString:@")"]) {
                            closingParenthesesPosition = i;
                            foundClosingParentheses = YES;
                            i--;
                        }
                    }
                    i++;
                }else{
                    if ([currentElement isKindOfClass:[NSString class]]) {
                        if ([currentElement isEqualToString:@"("]) {
                            openingParenthesesPosition = i;
                            foundOpeningParentheses = YES;
                            i++;
                        }
                    }
                    i--;
                }
            }
            
            //call recursively the solveEquationRecursive if necessary
            if ([tempEquation containsObject:@"("]) {
                NSMutableArray* newEquation = [NSMutableArray arrayWithArray:[tempEquation subarrayWithRange:NSMakeRange(openingParenthesesPosition+1, (closingParenthesesPosition-openingParenthesesPosition)-1)]];
                NSArray* tempResult = [NSArray arrayWithArray:[self solveEquationRecursive:newEquation]];
                [tempEquation removeObjectsInRange:NSMakeRange(openingParenthesesPosition+1, (closingParenthesesPosition-openingParenthesesPosition)-1)];
                NSArray* firstPart = [tempEquation subarrayWithRange:NSMakeRange(0, openingParenthesesPosition+1)];
                NSArray* secondPart = [tempEquation subarrayWithRange:NSMakeRange(openingParenthesesPosition+1,([tempEquation count]-openingParenthesesPosition)-1)];
                tempEquation = [NSMutableArray arrayWithArray:firstPart];
                [tempEquation addObjectsFromArray:tempResult];
                [tempEquation addObjectsFromArray:secondPart];
            }
            
        }
        
        //searching for factorial
        for (int i=0; i < (tempEquation.count-1); i++) {
            recursiveFactorial(i, tempEquation, self);
        }
        
        //add * signal where necessary
        for (int i=0; i < (tempEquation.count-1); i++) {
            id currentComponent = [tempEquation objectAtIndex:i];
            
            if ([currentComponent isKindOfClass:[NSNumber class]]) {
                id nextComponent = [tempEquation objectAtIndex:i+1];
                if ([nextComponent isKindOfClass:[NSNumber class]]) {
                    [tempEquation insertObject:@"*" atIndex:i+1];
                }
            }
        }
        
        //searching for trigonometric functions
        for (int i=1; i < tempEquation.count; i++) {
            recursiveTrig(&i, tempEquation, self);
        }
        
        //add * signal where necessary
        for (int i=0; i < (tempEquation.count-1); i++) {
            id currentComponent = [tempEquation objectAtIndex:i];
            
            if ([currentComponent isKindOfClass:[NSNumber class]]) {
                id nextComponent = [tempEquation objectAtIndex:i+1];
                if ([nextComponent isKindOfClass:[NSNumber class]]) {
                    [tempEquation insertObject:@"*" atIndex:i+1];
                }
            }
        }
        
        
        //searching for square root
        for (int i=1; i < tempEquation.count; i++) {
            recursiveSquareRoot(&i, tempEquation, self);
        }
        
        //add * signal where necessary
        for (int i=0; i < (tempEquation.count-1); i++) {
            id currentComponent = [tempEquation objectAtIndex:i];
            
            if ([currentComponent isKindOfClass:[NSNumber class]]) {
                id nextComponent = [tempEquation objectAtIndex:i+1];
                if ([nextComponent isKindOfClass:[NSNumber class]]) {
                    [tempEquation insertObject:@"*" atIndex:i+1];
                }
            }
        }
        
        //searching for exponential
        for (int i=0; i < (tempEquation.count-1); i++) {
            recursiveExponential(i, tempEquation, self);
        }
        
        //add * signal where necessary
        for (int i=0; i < (tempEquation.count-1); i++) {
            id currentComponent = [tempEquation objectAtIndex:i];
            
            if ([currentComponent isKindOfClass:[NSNumber class]]) {
                id nextComponent = [tempEquation objectAtIndex:i+1];
                if ([nextComponent isKindOfClass:[NSNumber class]]) {
                    [tempEquation insertObject:@"*" atIndex:i+1];
                }
            }
        }
        
        //searching for multiplication and division
        for (int i=0; i < (tempEquation.count-1); i++) {
            recursiveMultiplicationDivision(i, tempEquation, self);
        }
        
        //add * signal where necessary
        for (int i=0; i < (tempEquation.count-1); i++) {
            id currentComponent = [tempEquation objectAtIndex:i];
            
            if ([currentComponent isKindOfClass:[NSNumber class]]) {
                id nextComponent = [tempEquation objectAtIndex:i+1];
                if ([nextComponent isKindOfClass:[NSNumber class]]) {
                    [tempEquation insertObject:@"*" atIndex:i+1];
                }
            }
        }
        
        //searching for addition and subtraction
        for (int i=0; i < (tempEquation.count-1); i++) {
            recursiveAddSubtract(i, tempEquation, self);
        }
        
        if (tempEquation.count==1) {
            isEquationSolved = YES;
        }
    }
    
    return tempEquation;
}

-(double)solveEquation{
    return [[[self solveEquationRecursive:_equation] firstObject] doubleValue];
}

@end