class Battery < Item

  attr_reader :charge, :weight

  def initialize
    @name = "Battery"
    @charge = 10
    @weight = 25
  end



end