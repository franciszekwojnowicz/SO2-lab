import random

def ai_move(board):
    found_empty = True
    while found_empty:
        i = random.randint(0,2)
        j = random.randint(0,2)
        if board[i][j] == "":
            board[i][j] = "o"
            found_empty = False
    return board


def get_user_move(board):

    good_move = True
    while good_move:
        try:
            player_move = int(input("give your move from 1 to 9: "))
        except Exception as e:
            print(e)
        
        temp = 1
        for i in range(3):
            for j in range(3):
                if temp == player_move and board[i][j] == "":
                    board[i][j] = "x"
                    good_move = False
                temp =+ 1
    return board

def is_player_starting():
    player_decision = input("If you want to start type \"yes\": ")
    if player_decision == "yes":
        return True
    else:
        return False
    
if __name__ == "__main__":
    print(get_user_move(board))
    #print(is_player_starting())