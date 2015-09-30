//
//  CalculatorBrain.m
//  NewCalculator
//
//  Created by Diego Leal Togni on 10/3/14.
//  Copyright (c) 2014 Gannon University. All rights reserved.
//  modified by KW

#import "CalculatorBrain.h"

@interface CalculatorBrain ()
@property (nonatomic) double operand;
@property (nonatomic) double result;
@property NSMutableArray* tempEquation;
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
    _result = secondNumber;
    
    NSString *key = operation;
    
    ((void (^)())@{
    @"+" : ^{
        _result = firstNumber + secondNumber;
    },
    @"-" : ^{
        _result = firstNumber - secondNumber;
    },
    @"*" : ^{
        _result = firstNumber * secondNumber;
    },
    @"/" : ^{
        if (secondNumber)
        {
            _result = firstNumber / secondNumber;
        }
    },
    @"sin" : ^{
        _result = sin(secondNumber);
    },
    @"cos":^{
        _result = cos(secondNumber);
    },
    @"sqrt":^{
        _result = sqrt(secondNumber);
    },
    @"+/-":^{
        _result = secondNumber*-1;
    },
    @"!":^{
        if (secondNumber>=0){
            _result = factorial(secondNumber);
        }
    },
    @"1/x":^{
        if (secondNumber)
        {
            _result = (1/secondNumber);
        }
        
    },
    @"x^2":^{
        double base = secondNumber;
        _result = pow(base, 2);
    },
    @"x^y":^{
        _result = pow(firstNumber, secondNumber);
    },
                   
    }[key] ?: ^{
        NSLog(@"default");
    })();
    
    NSLog(@"Calc:\nNum1: %g\nOper: %@\nNum2: %g\nResult: %g",firstNumber,operation,secondNumber,_result);
    
    return _result;
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
    double num = [number doubleValue];
    double decimalPortion = num - floor(num);
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

-(NSMutableArray *)solveEquationRecursive:(NSMutableArray *)equation{
    
    _tempEquation = [NSMutableArray arrayWithArray:equation];
    
    BOOL isEquationSolved = NO;
    while (!isEquationSolved) {
        
        while ([_tempEquation containsObject:@"("]) {

            [self searchForNumsSurroundedByParenthesis:_tempEquation];

            [self addSignal:_tempEquation];

            int closingParenthesesPosition = 0;
            int openingParenthesesPosition = 0;
            int i= 0;
            BOOL foundClosingParentheses = NO;
            BOOL foundOpeningParentheses = NO;

            while ((i < _tempEquation.count)&&(!foundOpeningParentheses)) {
                id currentElement = [_tempEquation objectAtIndex:i];
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

            if ([_tempEquation containsObject:@"("]) {
                NSMutableArray* newEquation = [NSMutableArray arrayWithArray:[_tempEquation subarrayWithRange:NSMakeRange(openingParenthesesPosition+1, (closingParenthesesPosition-openingParenthesesPosition)-1)]];
                NSArray* tempResult = [NSArray arrayWithArray:[self solveEquationRecursive:newEquation]];
                [_tempEquation removeObjectsInRange:NSMakeRange(openingParenthesesPosition+1, (closingParenthesesPosition-openingParenthesesPosition)-1)];
                NSArray* firstPart = [_tempEquation subarrayWithRange:NSMakeRange(0, openingParenthesesPosition+1)];
                NSArray* secondPart = [_tempEquation subarrayWithRange:NSMakeRange(openingParenthesesPosition+1,([_tempEquation count]-openingParenthesesPosition)-1)];
                _tempEquation = [NSMutableArray arrayWithArray:firstPart];
                [_tempEquation addObjectsFromArray:tempResult];
                [_tempEquation addObjectsFromArray:secondPart];
            }
            
        }

        [self searchForFactorial:_tempEquation];

        [self addSignal:_tempEquation];

        [self searchForTrigFunc:_tempEquation];

        [self addSignal:_tempEquation];

        [self searchForSquareRoot:_tempEquation];

        [self addSignal:_tempEquation];

        [self searchForExponential:_tempEquation];

        [self addSignal:_tempEquation];

        [self searchForMultAndDiv:_tempEquation];

        [self addSignal:_tempEquation];

        [self searchForAddAndSub: _tempEquation];
        
        if (_tempEquation.count==1) {
            isEquationSolved = YES;
        }
    }
    
    return _tempEquation;
}

-(double)solveEquation{
    return [[[self solveEquationRecursive:_equation] firstObject] doubleValue];
}

-(void)addSignal: NSMutableArray{
    for (int i=0; i < (_tempEquation.count-1); i++) {
        id currentComponent = [_tempEquation objectAtIndex:i];
        
        if ([currentComponent isKindOfClass:[NSNumber class]]) {
            id nextComponent = [_tempEquation objectAtIndex:i+1];
            if ([nextComponent isKindOfClass:[NSNumber class]]) {
                [_tempEquation insertObject:@"*" atIndex:i+1];
            }
        }
    }
}

-(void)searchForNumsSurroundedByParenthesis: NSMutableArray{

    for (int i=1; i < (_tempEquation.count-1); i++) {
        id currentComponent = [_tempEquation objectAtIndex:i];
        if ([currentComponent isKindOfClass:[NSNumber class]]) {
            id nextComponent = [_tempEquation objectAtIndex:i+1];
            id previousComponent = [_tempEquation objectAtIndex:i-1];
            if ( ([nextComponent isKindOfClass:[NSString class]]) && ([previousComponent isKindOfClass:[NSString class]]) ) {
                if ( ([previousComponent isEqualToString:@"("]) && ([nextComponent isEqualToString:@")"]) ) {
                    [_tempEquation removeObjectAtIndex:i+1];
                    [_tempEquation removeObjectAtIndex:i-1];
                    i--;
                }
            }
        }
    }
}

-(void)searchForFactorial: NSMutableArray{

    for (int i=0; i < (_tempEquation.count-1); i++) {
        id currentComponent = [_tempEquation objectAtIndex:i];
        if ([currentComponent isKindOfClass:[NSNumber class]]) {
            id nextComponent = [_tempEquation objectAtIndex:i+1];
            if ([nextComponent isKindOfClass:[NSString class]]) {
                if ([nextComponent isEqualToString:@"!"]) {
                    double result = [self performOperation:@"!" firstOperand:0 secondOperand:[currentComponent doubleValue]];
                    [_tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:i];
                    [_tempEquation removeObjectAtIndex:i+1];
                    [_tempEquation removeObjectAtIndex:i+1];
                }
            }
        }
    }
}

-(void)searchForTrigFunc: NSMutableArray{

    for (int i=1; i < _tempEquation.count; i++) {
        id currentComponent = [_tempEquation objectAtIndex:i];
        if ([currentComponent isKindOfClass:[NSNumber class]]) {
            id previousComponent = [_tempEquation objectAtIndex:i-1];
            if ([previousComponent isKindOfClass:[NSString class]]) {
                if ([@[@"sin", @"cos"] containsObject:previousComponent]) {
                    double result = [self performOperation:previousComponent firstOperand:0 secondOperand:[currentComponent doubleValue]];
                    [_tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:i];
                    [_tempEquation removeObjectAtIndex:i+1];
                    [_tempEquation removeObjectAtIndex:i-1];
                    i--;
                }
            }
        }
    }
}

-(void)searchForSquareRoot: NSMutableArray{

    for (int i=1; i < _tempEquation.count; i++) {
        id currentComponent = [_tempEquation objectAtIndex:i];
        
        if ([currentComponent isKindOfClass:[NSNumber class]]) {
            id previousComponent = [_tempEquation objectAtIndex:i-1];
            if ( [previousComponent isKindOfClass:[NSString class]] ) {
                if ([previousComponent isEqualToString:@"sqrt"]) {
                    double result = [self performOperation:previousComponent firstOperand:0 secondOperand:[currentComponent doubleValue]];
                    [_tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:i];
                    [_tempEquation removeObjectAtIndex:i+1];
                    [_tempEquation removeObjectAtIndex:i-1];
                    i--;
                }
            }
        }
    }
}

-(void)searchForExponential: NSMutableArray{

    for (int i=0; i < (_tempEquation.count-1); i++) {
        id currentComponent = [_tempEquation objectAtIndex:i];
        
        if ([currentComponent isKindOfClass:[NSNumber class]]) {
            id nextComponent = [_tempEquation objectAtIndex:i+1];
            if ([nextComponent isKindOfClass:[NSString class]]) {
                if ([nextComponent isEqualToString:@"^"]) {
                    id nextNextComponent = [_tempEquation objectAtIndex:i+2];
                    if ([nextNextComponent isKindOfClass:[NSNumber class]]) {
                        double result = [self performOperation:@"x^y" firstOperand:[currentComponent doubleValue] secondOperand:[nextNextComponent doubleValue]];
                        [_tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:i];
                        [_tempEquation removeObjectAtIndex:i+1];
                        [_tempEquation removeObjectAtIndex:i+1];
                        [_tempEquation removeObjectAtIndex:i+1];
                    }
                }
            }
        }
    }
}

-(void)searchForMultAndDiv: NSMutableArray{

    for (int i=0; i < (_tempEquation.count-1); i++) {
        id currentComponent = [_tempEquation objectAtIndex:i];
        
        if ([currentComponent isKindOfClass:[NSNumber class]]) {
            id nextComponent = [_tempEquation objectAtIndex:i+1];
            if ([nextComponent isKindOfClass:[NSString class]]) {
                if ([@[@"*",@"/"] containsObject:nextComponent]) {
                    id nextNextComponent = [_tempEquation objectAtIndex:i+2];
                    if ([nextNextComponent isKindOfClass:[NSNumber class]]) {
                        double result = [self performOperation:nextComponent firstOperand:[currentComponent doubleValue] secondOperand:[nextNextComponent doubleValue]];
                        [_tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:i];
                        [_tempEquation removeObjectAtIndex:i+1];
                        [_tempEquation removeObjectAtIndex:i+1];
                        [_tempEquation removeObjectAtIndex:i+1];
                    }
                }
            }
        }
    }
}

-(void)searchForAddAndSub: NSMutableArray{

    for (int i=0; i < (_tempEquation.count-1); i++) {
        id currentComponent = [_tempEquation objectAtIndex:i];
        
        if ([currentComponent isKindOfClass:[NSNumber class]]) {
            id nextComponent = [_tempEquation objectAtIndex:i+1];
            if ([nextComponent isKindOfClass:[NSString class]]) {
                if ([@[@"+",@"-"] containsObject:nextComponent]) {
                    id nextNextComponent = [_tempEquation objectAtIndex:i+2];
                    if ([nextNextComponent isKindOfClass:[NSNumber class]]) {
                        double result = [self performOperation:nextComponent firstOperand:[currentComponent doubleValue] secondOperand:[nextNextComponent doubleValue]];
                        [_tempEquation insertObject:[NSNumber numberWithDouble:result] atIndex:i];
                        [_tempEquation removeObjectAtIndex:i+1];
                        [_tempEquation removeObjectAtIndex:i+1];
                        [_tempEquation removeObjectAtIndex:i+1];
                    }
                }
            }
        }
    }
}

@end