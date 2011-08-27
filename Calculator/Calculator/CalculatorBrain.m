//
//  CalculatorBrain.m
//  
//
//  Created by Robert Shedd on 8/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

- (void)setOperand:(double)anOperand
{
    operand = anOperand;
}

- (void)performWaitingOperation
{
    if ([@"+" isEqual:waitingOperation])
    {
        operand = waitingOperand + operand;
    }
    else if ([@"-" isEqual:waitingOperation])
    {
        operand = waitingOperand - operand;
    }
    else if ([@"*" isEqual:waitingOperation])
    {
        operand = waitingOperand * operand;
    }
    else if ([@"/" isEqual:waitingOperation])
    {
        // don't divide by 0
        if (operand)
        {
            operand = waitingOperand / operand;
        }
    }


}

- (double)performOperation:(NSString *)operation
{
    if ([operation isEqual:@"sqrt"])
    {
        operand = sqrt(operand);
    }
    else if ([operation isEqual:@"+/-"])
    {
        operand = -1 * operand;
    }
    else if ([operation isEqual:@"1/x"])
    {
        // invert the operand is not dividing by 0
        if (operand)
        {
            operand = 1 / operand;
        }
    }
    else if ([operation isEqual:@"sin"])
    {
        operand = sin(operand);
    }
    else if ([operation isEqual:@"cos"])
    {
        operand = cos(operand);
    }
    else if ([operation isEqual:@"Store"])
    {
        memoryStore = operand;
    }
    else if ([operation isEqual:@"Recall"])
    {
        operand = memoryStore;
    }
    else if ([operation isEqual:@"Mem+"])
    {
        operand += memoryStore;
    }
    else if ([operation isEqual:@"MemC"])
    {
        memoryStore = 0;
    }
    // clear everything
    else if ([operation isEqual:@"C"])
    {
        operand = 0;
        memoryStore = 0;
        waitingOperation = @"";
        waitingOperand = 0;
    }
    else
    {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    
    
    return operand;
}

@end
