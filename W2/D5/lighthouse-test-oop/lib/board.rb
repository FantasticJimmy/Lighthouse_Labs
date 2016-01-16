class Board

  MAX_X = 9

  # Types of Ship
  BATTLESHIP = 'B'
  DESTROYER  = 'D'
  CRUISER    = 'C'
  EMPTY      = '~'

  # The grid below represents the game grid. It's a hash of arrays of strings. Don't let the weird syntax confuse you. It's just a fancy way of defining an array of strings. Each row is actual an array of strings. Each spot is either empty (~) or has a ship: Battleship (B), Destroyer(D), or Cruiser(C).
  GRID = {
    #     0 1 2 3 4 5 6 7 8 9
    A: %w{~ ~ ~ C ~ ~ ~ B ~ ~},
    B: %w{~ ~ ~ C ~ ~ ~ B ~ ~},
    C: %w{~ ~ ~ ~ ~ ~ ~ B ~ ~},
    D: %w{~ ~ ~ ~ ~ ~ ~ B ~ ~},
    E: %w{~ ~ C C ~ ~ ~ ~ ~ ~},
    F: %w{~ ~ ~ ~ ~ D D D D ~},
    G: %w{~ ~ ~ ~ ~ ~ ~ ~ ~ ~}
  }

  def self.play(position)
    arr = position.split("",2)
    row = arr[0]
    col = arr[1]

    #not enought time but i know my split only split into H 1 1 instead of H 11 need to assign arr = position.split but this would mess up my cannot fire more than 10. 
    # If be more precise, I need to create anothe actual grid to simulate the current GRID hash of arry. So my hash of arry should contain actual ships. 
    if off_the_board?(row,col)
     raise OffBoardError, "Play #{row}#{col} off board"
    else
      case GRID[row.to_sym][col.to_i - 1]
        when "B"
        Battleship.new
        when "D"
        Destroyer.new
        when "C"
        Cruiser.new
        when "~"
        nil
      end
    end

  end

  def self.off_the_board?(row,col)
    col.to_i <= 0 ||(("A".."G").select {|letter| letter == row} == []) || ((0..10).select{|number| number == col.to_i} == [])
  end
end






