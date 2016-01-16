class Robot

  attr_reader :position
  attr_accessor :items, :equipped_weapon, :health, :max_capacity, :items_weight, :shield_charge, :name

@@record = []

  def show_robots_positions_without_myself
    arr = show_robots_without_myself
    arr.map {|robot| robot.position}
  end

  def show_robots_without_myself
    @@record - [self]
  end

  def show_robots
    @@record
  end

  def set_robots
    @@record = []
  end

  def self.show_robots_at(posi)
    @@record.select {|robot| robot.position == posi    }

  end

  def self.numbers_of_robot_mufced
    puts @@record.length
  end

  def initialize
    @position = [0,0]
    @items = []
    @health = 100
    @max_health = 100
    @equipped_weapon = nil
    @max_capacity = 250
    @items_weight = 0
    @@record << self
    @shield_charge = 0
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(new_item)
    #chcek if new_item is consumable 
    if is_a_consumeable?(new_item) && can_I_consume?(new_item)
      new_item.feed(self)
    #else check if u can carry it
    else
      try_to_equip?(new_item)
      try_to_carry?(new_item)
    end
  end

  def try_to_equip?(new_item)
    if new_item.is_a? Weapon
    @equipped_weapon = new_item
    end
  end

  def try_to_carry?(new_item)
    if (current_weight + new_item.weight)  <= @max_capacity
      @items << new_item
      @items_weight += new_item.weight
      if new_item.is_a? Shield
        @shield_charge = new_item.shield_point
      end
      if new_item.is_a? Battery
        @shield_charge += new_item.charge
      end
      @items
    else
      false
    end
  end

  def current_weight 
    weight = 0
    @items.each {|item| weight += item.weight}
    weight 
  end 

  def wound(damage)
    if @shield_charge >= damage
      damage = 0
      @shield_charge -= damage
    else 
      damage -= @shield_charge
      @shield_charge = 0
    end

    if damage > @health
      @health = 0
    else
      @health -= damage
    end
  end


  def heal(healing_points)
    if (@health + healing_points) > @max_health
      # @health = @max_health
    else
     @health += healing_points 
    end
  end

  def heal!(healing_points)
      if @health <= 0
        raise HealingError
      end
  end

  def attack(enemy)
    if can_I_attack?(enemy)
      case
        when @equipped_weapon == nil
          enemy.wound(5)
        when (@equipped_weapon.is_a? Weapon)
          @equipped_weapon.hit(enemy)
          @equipped_weapon = nil
        else
          @equipped_weapon.hit(enemy)
      end
    else
      nil
    end
  end

  # def drop_the_weapon
  #   @item.pop
  # end

  def attack!(enemy)
    if enemy.is_a? Robot
      if @equipped_weapon == nil
        enemy.wound(5)
      else
        @equipped_weapon.hit(enemy)
      end
    else
      raise "Can only attack a Robot!"
    end
  end

  def scann
   arr = show_robots_positions_without_myself.select do | item |
       ((item[0] - @position[0]).abs <= 1) && 
       ((item[1] - @position[1]).abs <= 1)
    end
    arr = arr.uniq
    i = 0
    while i < arr.length
    robots = Robot.show_robots_at(arr[i])
    i += 1
    end
    robots
  end

  def can_I_attack?(enemy)
    if @equipped_weapon.is_a? Grenade
      ((enemy.position[0] - @position[0]).abs == 2 && enemy.position[1] == @position[1]) || 
      ((enemy.position[1] - @position[1]).abs ==2 && enemy.position[0] = @position[0])
    else
  ((enemy.position[0] - @position[0]).abs + (enemy.position[1] - @position[1]).abs == 1 ) || (enemy.position == @position)
    end
  end

  def is_a_consumeable?(item)
    item.is_a? BoxOfBolts
  end

  def can_I_consume?(item)
    (100 - health - item.heal_points) >= 0
  end

end
