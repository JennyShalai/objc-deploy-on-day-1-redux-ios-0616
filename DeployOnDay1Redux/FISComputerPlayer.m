//
//  FISComputerPlayer.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISComputerPlayer.h"

@implementation FISComputerPlayer

+(BOOL)isEnabled {
    return YES;
}

-(FISTicTacToePosition)nextPlay {
    NSUInteger column;
    NSUInteger row;
    
    do {
        column = arc4random_uniform(3);
        row = arc4random_uniform(3);
    } while (![self.game canPlayAtColumn:column row:row]);
    return FISTicTacToePositionMake(column, row);
}

@end
