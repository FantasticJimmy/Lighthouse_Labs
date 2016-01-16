class Shield < Item

  attr_accessor :shield_point, :weight

  def initialize
    @name = "Shield"
    @shield_point = 50
    @weight = 150
  end


end