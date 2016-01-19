class Submarine

  attr_reader :depth, :tile, :total_revenue
  attr_accessor :cargo

  def initialize
    @depth = Ocean::SURFACE
    @tile = 0
    @cargo = []
    @count_dive = 0
    @total_revenue = 0
  end

  def dive!
    @count_dive = 1
    @depth -= 500 unless @depth == (Ocean::SURFACE - 500)
  end

  def surface
    @count_dive = 0
    @depth = Ocean::SURFACE unless @depth != -500
  end

  def descend
    if @depth == Ocean::MAX_DEPTH
      @depth = Ocean::MAX_DEPTH
      self.fish
      @depth
    else
      @depth -= 500 unless @depth == (Ocean::SURFACE)
      self.fish
      @depth
    end
  end

  def ascend
    @depth += 500 unless @depth >= -500 
    self.fish
    @depth
  end

  def forward
    @tile += 1 unless @tile == Ocean::MAX_TILE
    self.fish
    @depth
  end

  def backward
    @tile -=1 unless @tile <= 0
    self.fish
    @depth
  end

  def sushiable_fishes
    eatable = 0
    @cargo.each do |fish|
      eatable += 1 unless !fish.sushiable?
    end
    eatable
  end

  def fish
    @new_fish = Ocean.fish(@depth,@tile) unless @count_dive != 1
    @cargo << @new_fish
    @new_fish
  end

  def sell_cargo
    if @count_dive == 0
      @cargo.each {|fish| @total_revenue += fish.value}
      @cargo = []
      true
    else 
      false
    end
  end

end
