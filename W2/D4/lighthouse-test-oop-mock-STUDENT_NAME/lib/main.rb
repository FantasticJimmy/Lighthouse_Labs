require "./item.rb"
require "./battery.rb"
require "./robot.rb"
require "pry"

 robot = Robot.new("robot")
    ed = Robot.new("ed")
    jimmy = Robot.new("Jimmy")
    kat = Robot.new("Kat")
    yoojing = Robot.new("yoojing")

  robot.move_up
  ed.move_up 
  ed.move_right 
  kat.move_left
  kat.move_left
  yoojing.move_left
  yoojing.move_left
# puts robot.class.show_robots_at([0,1])

puts kat.scann

