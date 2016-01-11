
def bad_business_model(investment)
  c = investment.to_i / 2 
  @p = c
  @g = c

  total = 0
  total_p, total_g = 0, 0

  while (@p / 2 + @g / 4 != 0) do 
    c = @p / 2 + @g / 4
    total_p = total_p + @p/2
    total_g = total_g + @g/4
    @p = c + @p % 2 
    @g = c + @g % 4 
    total = total + c
  end
 
  return [(total+ investment.to_i / 2),total_p, total_g,@p,@g]
end

while true do
  puts "How much would you want to spend?"
  input = gets.chomp
  puts "You will be drinking #{bad_business_model(input)[0]} bottles of cokes in total."
  puts "You have redeemed #{bad_business_model(input)[1]} through bottle recycling and #{bad_business_model(input)[2]} through cap recycling!"
  puts "In the end, you are left with #{bad_business_model(input)[3]} empty bottles and #{bad_business_model(input)[4]} caps."
  puts "Great!\n next!"
end