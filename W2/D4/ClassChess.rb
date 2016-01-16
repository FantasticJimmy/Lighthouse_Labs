require "pry"

class Chess
  hash = {}

  hash[:empty] = 0
  hash[:general] = 1
  hash[:advisor] = 2
  hash[:elephant] = 3
  hash[:horse] = 4
  hash[:rook] = 5
  hash[:canon] = 6
  hash[:pawn] = 7

  board = []

  i = 0
  j = 0
  while i <= 9
    board[i]=[]
    while j <= 8
      board[i][j] = 0
      j += 1
    end
    j = 0
    i += 1
  end

  board[0][4],board[9][4] = 1 , 1
  board[0][3],board[9][3] = 2 , 2
  board[0][5],board[9][5] = 2 , 2
  board[0][2],board[9][2] = 3 , 3
  board[0][6],board[9][6] = 3 , 3
  board[0][1],board[9][1] = 4 , 4
  board[0][7],board[9][7] = 4 , 4
  board[0][0],board[9][0] = 5 , 5
  board[0][8],board[9][8] = 5 , 5
  board[2][1],board[7][1] = 6 , 6
  board[2][6],board[7][6] = 6 , 6
  board[3].each_with_index {|v,i| board[3][i] = 7 if i.even?}
  board[6].each_with_index {|v,i| board[6][i] = 7 if i.even?}

  def general
    if dead
      game.over
    end
  end

  board.length
