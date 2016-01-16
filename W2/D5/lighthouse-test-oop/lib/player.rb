class Player

  attr_accessor :shots_fired
  attr_reader :hits, :misses

  def initialize
    @shots_fired = 0
    @hits = []
    @misses = []
  end

  def fire(position)
    if self.shots_fired != 10

      self.shots_fired += 1 
      result = Board.play(position)
      if result != nil
        @hits << position
        result
      else
        @misses << position
        result
      end

    else
      false
    end 

  end

end
