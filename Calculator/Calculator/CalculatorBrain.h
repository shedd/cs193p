//
//  CalculatorBrain.h
//  
//
//  Created by Robert Shedd on 8/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//



@interface CalculatorBrain : NSObject {
    double operand;
    NSString *waitingOperation;
    double waitingOperand;
}

- (void)setOperand:(double)anOperand;
- (double)performOperation:(NSString *)operation;
- (void)performWaitingOperation;

@end
