class Weapon < Item

  attr_reader :name, :weight, :damage, :range

  def initialize(name,weight,damage)
    @name = name
    @weight = weight
    @damage = damage
  end

  def hit(enemy)
    enemy.wound(@damage)
  end
  
end