import numpy as np

def get_user_move(board):
    try:
        x = int(input("Podaj kolumne (INDEKSUJEMY OD 0!!!): "))
        y = int(input("Podaj wiersz (INDEKSUJEMY OD 0!!!): "))
    except:
        print("Musisz podac liczbe")
        return board
    if(x < 0 or x > 4 or y < 0 or y > 4):
        print("Podales koordynaty spoza zakresu")
        return board
    if(board[x][y] != " "):
        print("Pole jest juz zajete")
        return board
    board[x][y] = "X"
    return board

def ai_move(board):
    print("Ruch bota:")
    for i in range(5):
        for j in range(5):
            if(board[i][j] == " "):
                board[i][j]="O"
                return board


def is_player_starting():
    answer = input("Czy chcesz zaczynac? (t/n)")
    return answer == "t" or answer == "T"

def is_game_over(board):
    if (check_win(board) != 0):
        return True

    for i in range(4):
        for j in range(4):
            if(board[i][j] == " "):
                return False
    return True

def check_rows(board):
    for row in board:
        if len(set(row)) == 1:
            if row[0] != " ":
                return row[0]
    return 0

def check_diagonals(board):
    if len(set([board[i][i] for i in range(len(board))])) == 1:
        if board[0][0] != " ":
            return board[0][0]
    
    if len(set([board[i][len(board)-i-1] for i in range(len(board))])) == 1:
        if(board[0][len(board)-1] != " "): 
            return board[0][len(board)-1]
    return 0

def check_win(board):
    #transposition to check rows, then columns
    for newBoard in [board, np.transpose(board)]:
        result = check_rows(newBoard)
        if result:
            return result
    return check_diagonals(board)    

def announce_outcome(board, players_move = 0):
    outcome = check_win(board)
    if outcome == 0:
        print("Remis")
    else:
        print (f"Wygraly {outcome}")
    