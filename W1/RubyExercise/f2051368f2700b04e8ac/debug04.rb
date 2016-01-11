

def char_count(list)
  hash = Hash.new(0)
  list.each do |word|
    word.split('').inject(hash) do |memo, letter| 
      memo[letter] += 1 
      memo
    end
  end
  hash
end

# Why the long face(error)? 
# 1. This should return count of each letter in the list

puts char_count(['apples', 'oranges', 'hipsters', 'are', 'same'])


# 2. What are the improvements you can do to above code?
# I am not sure what improvements to make unless more demands requested from the user.