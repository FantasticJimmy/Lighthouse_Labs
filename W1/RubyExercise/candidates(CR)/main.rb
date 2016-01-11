# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here
def qualified_candidates(candidates)
  candidates.select do |x|
    experienced?(x) && github_100?(x) && knowRnP?(x) && applied?(x) && adult?(x)  
  end
end
# binding.pry

def ordered_by_qualification(candidates)
  onew = candidates.sort_by do|x|
    # y[:years_of_experience] <=> x[:years_of_experience]
    [x[:years_of_experience],x[:github_points]]
  end
  onew.reverse
end

def display_by_id(candidates, id)
  dnew = candidates.select do |x|
    x[:id] == id
  end
  dnew
end

while(true) do
  puts "What option would you like to perform?(Find, All, Qualified, or Quit)"
  option = gets.chomp.downcase
  case option
  when "find"
    puts "Indicate the candidate ID: "
    id = gets.chomp.to_i
    pp display_by_id(@candidates, id)
  when "all"
    @candidates.each{|x|puts x}
  when "qualified"
    pp ordered_by_qualification(@candidates)
  when "quit"
    break
  else 
    "Invalid input"
  end
end

