require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...
puts "Yearly revenue of all stores under this brand is $#{Store.sum(:annual_revenue)}."
puts "Average annual revenue is #{Store.sum(:annual_revenue) / Store.count}"
number  =  Store.where("annual_revenue > ?",[1000000]).count
puts "#{number} stores that are generating $1M or above revenue in annual sales."