class Game

  def begin(players)
    players = players
    i = 0
    truthy = Array.new(players.length,true)
    while truthy == players.map{|player|player.is_alive?} do 
      current_player = players[i % players.length]  
      # binding.pry
      question = Question.new
      question.display(current_player)
      outcome(question) ? result_of_turn(true,players,current_player) : result_of_turn(false,players,current_player)
      i += 1
    end 
    puts ''
    puts "GAME OVER!\nWinner is #{players[i % players.length].name}!"
    display_score_board(players)
  end

  def result_of_turn(result,players,current_player)
    if result
      puts "Right!"
      current_player.win_a_turn
      puts ''
    else 
      puts "Wrong!"
      current_player.lose_a_turn
      display_score_board(players)
      puts ''
    end
  end

  def outcome(question)
    question.answer == gets.chomp.to_i
  end

  def display_score_board(players)
    puts "Scoreboard: ".colorize(:blue)
    players.each do |x|  
      puts "#{x.colorized_name}: #{x.score}"
    end
  end

  def countinue?(players)
    if gets.chomp.downcase == "yes"
      players.each{|player| player.reset_life}
      return true 
    else 
      return false
    end
  end  
    
end