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
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)
        [self resetBoard];
    }
    return self;
}

-(void)resetBoard {
    // clear the game board of all player moves
    _board = [[NSMutableArray alloc] initWithCapacity: 3];
    [_board insertObject:[NSMutableArray arrayWithObjects:@"",@"",@"",nil] atIndex:0];
    [_board insertObject:[NSMutableArray arrayWithObjects:@"",@"",@"",nil] atIndex:1];
    [_board insertObject:[NSMutableArray arrayWithObjects:@"",@"",@"",nil] atIndex:2];
    _currentPlayer = @"";

}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row {
    // determine what player has a piece at the given position.
    // It should return a string representing which player (if any) has a piece at the given position.
    // Valid return values are "X", "O", and "" (the empty string, for a space with no piece).
    NSLog(@"playerAtColumn");
    if ([_board[row][column] isEqual: @"X"]) {
        return @"X";
    } else if ([_board[row][column] isEqual: @"O"]) {
        return @"O";
    } else return @"";
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row {
    // return YES if the given position is a valid place to play a piece, and NO if not
    NSLog(@"canPlayAtColumn");
    if (_board[row][column] == nil || [_board[row][column]  isEqual: @""]) {
        return YES;
    } else {
    return NO;
    }
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row {
    NSLog(@"playXAtColumn");
    _board[row][column] = @"X";
    _currentPlayer = @"X";
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row {
    NSLog(@"playOAtColumn");
    _board[row][column] = @"O";
    _currentPlayer = @"O";
}

-(NSString *)winningPlayer {
    // called after every turn is completed.
    // It should check if the board currently has a winner, and return "X", "O", or ""
    // the empty string, meaning no winner
    NSLog(@"winningPlayer");
    
    if ((_board[0][0] == _board[0][1]) && (_board[0][0] == _board[0][2])) {
        if (![_board[0][0] isEqualToString:@""]) {
            return _currentPlayer;
        }
    } else if ([_board[0][1] isEqualToString:_board[1][1]] && (_board[0][1] == _board[2][1])) {
        if (![_board[0][1] isEqualToString:@""]) {
            return _currentPlayer;
        }
    } else if ((_board[0][2] == _board[1][2]) && (_board[0][2] == _board[2][2])) {
        if (![_board[0][2] isEqualToString:@""]) {
            return _currentPlayer;
        }
    } else if ((_board[0][0] == _board[0][1]) && (_board[0][0] == _board[0][2])) {
        if (![_board[0][0] isEqualToString:@""]) {
            return _currentPlayer;
        }
    } else if ((_board[1][0] == _board[1][1]) && (_board[1][0] == _board[1][2])) {
        if (![_board[1][0] isEqualToString:@""]) {
            return _currentPlayer;
        }
    } else if ((_board[2][0] == _board[2][1]) && (_board[2][0] == _board[2][2])) {
        if (![_board[2][0] isEqualToString:@""]) {
            return _currentPlayer;
        }
    } else if ((_board[0][0] == _board[1][1]) && (_board[0][0] == _board[2][2])) {
        if (![_board[0][0] isEqualToString:@""]) {
            return _currentPlayer;
        }
    } else if ((_board[2][0] == _board[1][1]) && (_board[0][2] == _board[1][1])) {
        if (![_board[2][0] isEqualToString:@""]) {
            return _currentPlayer;
        }
    }
    return @"";
}

-(BOOL)isADraw {
    NSLog(@"isADraw");
    NSString *win = [self winningPlayer];
    BOOL SpaceToMove = NO;
    
    for (NSArray *element in _board) {
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
