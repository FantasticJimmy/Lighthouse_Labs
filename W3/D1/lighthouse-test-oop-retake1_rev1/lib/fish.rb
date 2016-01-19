class Fish

  attr_reader :weight, :value, :value_per_kg

  def initialize(weight = 1,value = 15)
    @weight = weight
    @value = value.to_f
    @value_per_kg = @value / @weight
  end

  def sushiable?
    if (self.is_a? GiantSalmon)||(self.is_a? GiantTuna)
      true
    else
      false
    end
  end

end
