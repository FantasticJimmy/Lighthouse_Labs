
def sign_cost(dimension,color_count)
  total = dimension * 15.00
  if color_count > 2 
    total += color_count * 15.00
  else
    total += color_count* 10.00
  end
  total*(1.15)
end
a=sign_cost(12,4)
puts "$"+"%.2f" %a
