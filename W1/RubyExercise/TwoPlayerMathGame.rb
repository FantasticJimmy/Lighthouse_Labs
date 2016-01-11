def question(players)
  rand1 = Random.rand(20)
  rand2 = Random.rand(20)

  rand_sign = Random.rand(2) == 0 ? "+" : "-"
  if rand_sign == "+"
    answer = rand1 + rand2
  else
    answer = rand1 - rand2
  end
  puts question = "-> Player #{players[:id]}: What does #{rand1} #{rand_sign} #{rand2} equal?"
  answer
end
players= [{id: 1,life: 3,score: 0},{id: 2,life: 3,score: 0}]

i = 0
while true 
  current_player = i%players.length
  answer = question(players[current_player])
  if gets.chomp.to_i != answer
    players[current_player][:life] -= 1
    players.map {|x|puts "player #{x[:id]} score: #{x[:score]} life: #{x[:life]}"}
  else 
    players[current_player][:score] += 1
  end
  winner = players[(i+1)%players.length][:id]
  break if players[i%players.length][:life] == 0 || players[(i+1)%players.length][:life] == 0
  i = i + 1
end 

puts "Final Scoreboard"
puts "Player 1: #{players[0][:score]} points         Player 2: #{players[1][:score]} points"
puts "Winning is Player #{winner}!!!!"



