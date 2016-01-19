require "./item.rb"
require "./battery.rb"
require "./shield.rb"
require "./box_of_bolts.rb"
require "./robot.rb"
require "pry"
require "./weapon.rb"
require "./grenade.rb"
require "./bazuka.rb"
 robot = Robot.new
    ed = Robot.new
    jimmy = Robot.new
    kat = Robot.new
    yoojing = Robot.new
    haha = Bazuka.new
    shield = Shield.new
  robot.move_up
  ed.move_up 
  ed.move_right 
  kat.move_left
  kat.move_up
  yoojing.move_left
  yoojing.move_left
  jimmy.move_down
  jimmy.move_down
  jimmy.move_down
  robot.pick_up(haha)
  kat.pick_up(shield)
puts robot.scann
  robot.attack(kat)
  puts kat.health
  puts ed.health
# puts robot.show_robots

