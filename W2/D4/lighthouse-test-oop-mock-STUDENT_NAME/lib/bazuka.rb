class Bazuka < Weapon

  def initialize
    @name = "Bazuka"
    @weight = 40
    @damage = 15
    @range = 1
  end

  def hit(enemy)
    enemy.wound(@damage,@name)
  end
end