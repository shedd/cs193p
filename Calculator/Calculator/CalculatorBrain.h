//
//  CalculatorBrain.h
//  
//
//  Created by Robert Shedd on 8/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//



@interface CalculatorBrain : NSObject {
@private
    NSString *waitingOperation;
    double waitingOperand;
    double memoryStore;
}

@property double operand;

- (double)performOperation:(NSString *)operation;
- (void)performWaitingOperation;

@end
