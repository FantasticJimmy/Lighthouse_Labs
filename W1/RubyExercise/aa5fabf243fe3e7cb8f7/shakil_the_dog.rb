# Save this file to your computer so you can run it 
# via the command line (Terminal) like so:
#   $ ruby shakil_the_dog.rb
#
# Your method should wait for user input, which corresponds
# to you saying something to your dog (named Shakil).
 
# You'll probably want to write other methods, but this 
# encapsulates the core dog logic
def shakil_the_dog (action)
  
  case 
  when (action.include? "threat")
    puts "arrr"
  when action == "woof"
    puts "WOOF WOOF WOOF"
  when action == "shakil stop" , action == "shakil stop!"
    puts "..."
  when action == "meow"
    puts "woof woof woof woof woof"
  when action == "go away"
   puts "Shakil leaves you quietly."
   else
   puts "No respond~"    
  end


end
 
# Run our method
loop do
  print "me: "
  action = gets.chomp.downcase
  break if action == "exit"
  shakil_the_dog(action)
end 