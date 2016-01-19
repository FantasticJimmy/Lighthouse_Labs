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
    @@record.select {|robot| robot.position == posi }
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

  def damage_shield(damage)
    if @shield_charge >= damage
      @shield_charge -= damage
      damage = 0
    else 
      damage -= @shield_charge
      @shield_charge = 0
      damage
    end
  end

  def wound(damage_1,name = nil)
    damage = damage_1
    if name == "Bazuka"
      if damage > @health
        @health = 0
      else
        @health -= damage
      end
    else
      damage = damage_shield(damage_1) 
      if damage > @health
        @health = 0
      else
        @health -= damage
      end
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
        when (@equipped_weapon.is_a? Bazuka)
          self.scann.each do |enemy_nearby|
            @equipped_weapon.hit(enemy_nearby)
          end
        when (@equipped_weapon.is_a? Grenade)
          @equipped_weapon.hit(enemy)
          @equipped_weapon = nil
        when (@equipped_weapon.is_a? Weapon)
          @equipped_weapon.hit(enemy)
        else
          enemy.wound(5)
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
    #arr are the ones that are close to me
    #but if they are on the same spot i need to just search one spot
    new_arr = arr.uniq
    i = 0
    robots = []
    #I wanna to search number of times equavelent to the numbers of arr.length not new_arr.length since show_robots_at only match out 1 robot at a time
    while i < arr.length
    robots << Robot.show_robots_at(new_arr[i])
    i += 1
    end
    #each search gonna give me a arr of robots
    robots.flatten
  end

  def can_I_attack?(enemy)
    if @equipped_weapon.is_a? Grenade
      ((enemy.position[0] - @position[0]).abs == 2 && enemy.position[1] == @position[1]) || 
      ((enemy.position[1] - @position[1]).abs ==2 && enemy.position[0] = @position[0])
    else
  ((enemy.position[0] - @position[0]).abs + (enemy.position[1] - @position[1]).abs == 1 ) ||
  (enemy.position == @position)
    end
  end

  def is_a_consumeable?(item)
    item.is_a? BoxOfBolts
  end

  def can_I_consume?(item)
    (100 - health - item.heal_points) >= 0
  end

end
