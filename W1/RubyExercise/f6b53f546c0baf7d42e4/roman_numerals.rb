require "pry"
def to_roman(num)
  hash = {
    M: 1000,
    D: 500,
    C: 100,
    L: 50,
    X: 10,
    V: 5,
    I: 1,
  }

  mod = num 
  output = ""
  hash.each do |x,y| 
  times =  mod / y
  mod = mod % y
  #binding.pry
  output << (x.to_s * times)
  end

return output
end
 
# Drive code... this should print out trues.
 
puts to_roman(1) 
puts to_roman(3) == "III"
puts to_roman(6) == "VI"
puts to_roman(1235) 

 
# TODO: what other cases could you add to ensure your to_roman method is working?

