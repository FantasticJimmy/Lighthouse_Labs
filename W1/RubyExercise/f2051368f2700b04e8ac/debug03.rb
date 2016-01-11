def sum(list)
  summ = 0
  list.each {|x| summ += x}
  return summ
end

list1 = [16,21,31,42,55]

# 1. The following should return 165 instead of an error
puts sum(list1)

# 2. How would you refactor it using an enumerable method other than each? Examples of enumerables: map, select, inject, reject, detect.
##########################################################
def sum_map(list)
  summ = 0
  list.map {|x| summ += x }
  summ
end

puts sum_map(list1)
##########################################################
def sum_select(list)
  summ = 0
  list.select {|x| summ += x }
  summ
end

puts sum_select(list1)
##########################################################
def sum_inject(list) 
  list.inject(0) {|memo,x| memo = memo + x} 
end

puts sum_inject(list1)
##########################################################
