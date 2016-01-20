require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...

Store.create(name: "Surrey",annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
Store.create(name: "Whistler",annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
Store.create(name: "Yaletown",annual_revenue: 430000, mens_apparel: true, womens_apparel: true)



mens_stores = Store.where(mens_apparel: true)
mens_stores.each do |mens_store|
  puts "#{mens_store.name} generate $#{mens_store.annual_revenue} every year."
end 

result = Store.where("womens_apparel = ? and annual_revenue < ?",true,1000000)
result.each do |store|
 puts "#{store.name} is generating less than 1M annually."
end