class Barracks
  attr_reader :gold, :food, :lumber
  attr_accessor :health_points
  def initialize
    @health_points = 500
    @gold = 1000
    @food = 80
    @lumber = 500
  end
  def can_train_footman?
    food < 2 || gold < 135 ? false : true
  end
  def train_footman
    if can_train_footman?
      @gold = @gold - 135
      @food -= 2
      Footman.new
    else
      puts "Not enough resources."
      nil
    end
  end
  def can_train_peasant?
    food < 5 || gold < 90 ? false : true
  end 
  def train_peasant
    if can_train_peasant?
      @gold = @gold - 90
      @food = @food - 5
      Peasant.new
    else
      puts "Not enough resources."
      nil
    end
  end

  def damage(enemy)
    case enemy.class.to_s.downcase
      when "footman" 
        @health_points -= (enemy.attack_power/2).ceil
      when "unit"
        @health_points -= attack_power
      when "siege"
        @health_points -= enemy.attack_power * 2
    end
  end

  def can_train_siege?
    food < 3 || gold < 200 || lumber < 60 ? false : true
  end
  def train_seige
    @gold = @gold - 200
    @food = @food - 3
    @lumber = @lumber - 60
    Seige.new
  end
  def dead?
    health_points <= 0 ? true : false
  end

end

