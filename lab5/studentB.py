import random

def api_move(board):
    found_empty = True
    while found_empty:
        i = random.randint(1,3)
        j = random.randint(1,3)
        if board[i][j] == "":
            board[i][j] = "o"
    return board

def get_user_move(board):
    try:
        player_move = int(input("give your move from 1 to 9: "))
    except Exception as e:
        print(e)
    
    for i in range(3):
        for j in range(3):
            if i+j == player_move:
                board[i][j] = "x"
    return board

def is_player_starting():
    player_decision = input("If you want to start type \"yes\": ")
    if player_decision == "yes":
        return True
    else:
        return False

if __name__ == "__main__":
    board = []
    #print(get_user_move(board))
    print(is_player_starting())