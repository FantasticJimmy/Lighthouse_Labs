require './player_class.rb'
require 'pry'
require 'colorize'
require './game_class.rb'
require './question_class.rb'

class Main

  def self.start
    i = 1
    players = []

    begin 
      puts "What is the name of player #{i}?"
      name = gets.chomp
      until name != "" do
        begin 
          raise NameEmptyError
        rescue
          puts "You must enter a name:"
        end
      name = gets.chomp
      end
      puts "Define your signified color:"
      color = gets.chomp.to_sym
      players[i-1]=Player.new(name,i,color)
      puts "Is this all?" 
      i += 1
    end while gets.chomp.downcase != "yes"

    begin
      game = Game.new(players)
      game.begin 
      puts "Want to countinue?"
    end while game.countinue?
  end

end

Main.start

