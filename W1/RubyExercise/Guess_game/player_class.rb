class Player

  attr_accessor :name, :score
  attr_reader :id

  def initialize(name, id, color)
    @name = name
    @id = id
    @life = 3
    @score = 0
    @color = color
  end

  def win_a_turn
    @score += 1
  end

  def lose_a_turn
    @life -= 1
  end

  def colorized_name
    @name.colorize(@color)
  end

  def is_alive?
    @life != 0 
  end
  
  def reset_life
     @life = 3
  end

end



