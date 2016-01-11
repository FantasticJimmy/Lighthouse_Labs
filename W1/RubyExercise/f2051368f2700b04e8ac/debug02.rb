def average(numbers)
  sum = 0
  if numbers.empty?
    puts "You cant pass in an empty array"
  else
    new = numbers.select {|x| x != nil}
    new.each do |num|
      sum += num.to_f
    end
    ave = sum / new.size
  end
  return ave
end

## TEST HELPER METHOD
def test_average(array=[])
  print "avg of #{array.inspect}:"
  result = average(array)
  p result
end

## TEST CODE
test_average([4,5,6]) # => 5
test_average([15,5,10]) # => 10

# Should treat string like number
test_average([15,'5',10]) # => 10

# Should show decimal value
test_average([10, 5]) # => 7.5 instead of just 7

# Watch out! Even tests can have bugs!
test_average([9, 5, 7])

# Empty set should return nil, not throw an error
test_average([]) # => nil

# Non-existent set should return nil
test_average() # => nil

# BONUS: Should ignore nils in the set
test_average([9,6,nil,3]) # => 6
