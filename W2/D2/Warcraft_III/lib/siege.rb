class Siege < Unit

  attr_reader :health_points, :attack_power
  
  def initialize
    @health_points = 400
    @attack_power = 50
  end

  def check(enemy)
    enemy.class.to_s.downcase
  end

  def attack!(enemy)
    if check(enemy) == "barracks"
      enemy.damage(self) unless enemy.dead?
    elsif check(enemy) == "siege"
      enemy.damage(enemy) unless  enemy.dead?(self)
    else
        dead?(enemy)
    end
  end

  def damage(enemy)
    @health_points -= enemy.attack_power  unless dead?(enemy)
  end

  def dead?(enemy)
    if enemy.class.to_s.downcase == "barracks" || enemy.class.to_s.downcase == "siege"
      # health_points <= 0 ? true : false
      super()
    else
      true
    end
  end

end


