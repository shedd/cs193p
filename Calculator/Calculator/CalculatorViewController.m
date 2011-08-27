//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Robert Shedd on 8/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

- (CalculatorBrain *)brain
{
    if(!brain)
    {
        brain = [[CalculatorBrain alloc] init];
    }
    
    return brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [[sender titleLabel] text];
                        
    if(userIsInTheMiddleOfTypingANumber)
    {
        // was the key pressed a decimal?
        if([@"." isEqual:digit])
        {
            // only allow one decimal point in a number
            if ([[display text] rangeOfString:@"."].location != NSNotFound)
            {
                // blank digit if a decimal point is found
                digit = @"";
            }
        }
        
        [display setText:[[display text] stringByAppendingString:digit]];
    }
    else
    {
        // if the user has pressed the . key prepend 0
        if([@"." isEqual:digit])
        {
            digit = [@"0" stringByAppendingString:digit];
        }
        
        [display setText:digit];
        userIsInTheMiddleOfTypingANumber = YES;
    }
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if(userIsInTheMiddleOfTypingANumber)
    {
        [[self brain] setOperand:[[display text] doubleValue]];
        userIsInTheMiddleOfTypingANumber = NO;
    }
    
    NSString *operation = [[sender titleLabel] text];
    
    // check to make sure that this is a valid operation
    if ([operation isEqual:@"1/x"] || [@"/" isEqual:operation])
    {
        // invert the display is not dividing by 0
        if (![[display text] doubleValue])
        {
            UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Error" message:@"You can't divide by zero." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
            [alert show];
        }
    }
    
    // perform the operation
    double result = [[self brain] performOperation:operation];
    
    //send to display
    [display setText:[NSString stringWithFormat:@"%g", result]];
}

@end
