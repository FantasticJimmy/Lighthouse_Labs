class BoxOfBolts <  Item

  attr_reader :name, :weight, :heal_points

  def initialize
    @name = "Box of bolts"
    @weight = 25
    @heal_points = 20
  end

  def feed(robot)
    robot.heal(@heal_points)
  end

end