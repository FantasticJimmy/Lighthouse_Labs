def count_letters(input)
  hash = Hash.new(0)

  input.split.each do |word|
    word.split('').inject(hash) do |memo, letter| 
      memo[letter] += 1 
      memo
    end
  end
  puts hash
  hash
end


def find_index(input)
  hash = Hash.new { |hash, key| hash[key] = [] }

  input.split('').each_with_index do |letter,index| 
    hash[letter] << index 
  end
  hash 
end



input = gets.chomp
count_letters(input)
puts find_index(input)

