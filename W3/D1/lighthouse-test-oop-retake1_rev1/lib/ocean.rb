class Ocean

  MAX_DEPTH = -2000
  MAX_TILE  = 9
  SURFACE   = 0

  # Types of Fish
  TUNA   = 'T'
  SALMON = 'S'
  EMPTY  = '~'

  # The board below represents the ocean. It's an array of arrays of strings (a 2 dimensional Array). Don't let the weird syntax confuse you. It's just a fancy way of defining an array of strings. Each depth is actual an array of strings. Each tile is either empty (~) or has fish: SALMON (S) or TUNA (T)

  # => => Forward direction => =>
  BOARD = [
    #  0 1 2 3 4 5 6 7 8 9   # Tile Number
    %w{~ ~ ~ S ~ ~ ~ T S T}, # Depth of -500
    %w{T T ~ ~ S ~ ~ S ~ ~}, # Depth of -1000
    %w{S ~ ~ T ~ S ~ T ~ S}, # Depth of -1500
    %w{~ ~ ~ T ~ S ~ S ~ ~}, # Depth of -2000
  ]
  # => => Forward direction => =>

  def self.fish(vertical,horizental)
    vertical = vertical / (-500) -1
    case BOARD[vertical][horizental] 
      when TUNA
        GiantTuna.new
      when SALMON
        GiantSalmon.new
      else
        nil
    end
  end

  

end
