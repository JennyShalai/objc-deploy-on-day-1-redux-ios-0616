//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()


@property (nonatomic, copy) NSString *currentPlayer;

@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        [self resetBoard];
    }
    return self;
}

-(void)resetBoard {
    // clear the game board of all player moves
    self.board = [[NSMutableArray alloc] initWithCapacity: 3];
    [self.board insertObject:[NSMutableArray arrayWithObjects:@"",@"",@"",nil] atIndex:0];
    [self.board insertObject:[NSMutableArray arrayWithObjects:@"",@"",@"",nil] atIndex:1];
    [self.board insertObject:[NSMutableArray arrayWithObjects:@"",@"",@"",nil] atIndex:2];
    self.currentPlayer = @"";

}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row {
    // determine what player has a piece at the given position.
    // It should return a string representing which player has a piece at the given position.
    // Valid return values are "X", "O", and ""
    if ([self.board[row][column] isEqual: @"X"]) {
        return @"X";
    } else if ([self.board[row][column] isEqual: @"O"]) {
        return @"O";
    } else return @"";
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row {
    // return YES if the given position is a valid place to play a piece, and NO if not
    if (self.board[row][column] == nil || [self.board[row][column]  isEqual: @""]) {
        return YES;
    } else {
        return NO;
    }
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row {
    self.board[row][column] = @"X";
    self.currentPlayer = @"X";
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row {
    self.board[row][column] = @"O";
    self.currentPlayer = @"O";
}

-(NSString *)winningPlayer {
    // called after every turn is completed
    // it should check if the board currently has a winner, and return "X", "O", or ""
    // the empty string, meaning no winner
    
    // top row
    if (([self.board[0][0] isEqualToString:self.board[0][1]])
     && ([self.board[0][0] isEqualToString:self.board[0][2]])
     && (![self.board[0][0] isEqualToString:@""]) ) {
            return self.currentPlayer;
        
        // middle row
        } else if ([self.board[0][1] isEqualToString:self.board[1][1]]
               && ([self.board[0][1] isEqualToString:self.board[2][1]])
               && (![self.board[0][1] isEqualToString:@""])) {
                    return self.currentPlayer;
            
        // bottom row
        } else if (([self.board[0][2] isEqualToString:self.board[1][2]])
               && ([self.board[0][2] isEqualToString:self.board[2][2]])
               && (![self.board[0][2] isEqualToString:@""])) {
                    return self.currentPlayer;
            
        // left column
        } else if (([self.board[0][0] isEqualToString:self.board[1][0]])
               && ([self.board[0][0] isEqualToString:self.board[2][0]])
               && (![self.board[0][0] isEqualToString:@""])) {
                    return self.currentPlayer;
            
        // middle column
        } else if (([self.board[1][0] isEqualToString:self.board[1][1]])
               && ([self.board[1][0] isEqualToString:self.board[1][2]])
               && (![self.board[1][0] isEqualToString:@""])) {
                    return self.currentPlayer;
            
        // right column
        } else if (([self.board[2][0] isEqualToString:self.board[2][1]])
               && ([self.board[2][0] isEqualToString:self.board[2][2]])
               && (![self.board[2][0] isEqualToString:@""])) {
                    return self.currentPlayer;
            
        // diagonal
        } else if (([self.board[0][0] isEqualToString:self.board[1][1]])
               && ([self.board[0][0] isEqualToString:self.board[2][2]])
               && (![self.board[0][0] isEqualToString:@""])) {
                    return self.currentPlayer;
            
        // diagonal
        } else if (([self.board[2][0] isEqualToString:self.board[1][1]])
               && ([self.board[0][2] isEqualToString:self.board[1][1]])
               && (![self.board[2][0] isEqualToString:@""])) {
                    return self.currentPlayer;
        }
    return @"";
}

-(BOOL)isADraw {
    NSString *win = [self winningPlayer];
    BOOL SpaceToMove = NO;
    
    for (NSArray *element in self.board) {
        if ([element containsObject:@""]) {
            SpaceToMove = YES;
        }
    }

    if ([win isEqualToString:@""] && SpaceToMove == NO) {
        return YES;
    }
    return NO;
}

@end
