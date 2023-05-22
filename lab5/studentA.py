#!/usr/bin/env python

def new_board():
    board = [[' ' for y in range(5)] for y in range(5)]
    return board

def print_board(board):
    for x in range (0,5):
        for y in range (0, 5):
            print("| " + board[x][y] , end ="" )
        print("| ")

board = new_board()
print_board(board)