require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
@store4 = Store.find(4)
@store5 = Store.find(5)
@store6 = Store.find(6)

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "Jimmy", last_name: "Virani", hourly_rate: 53)
@store2.employees.create(first_name: "Zues", last_name: "Virani", hourly_rate: 42)
@store5.employees.create(first_name: "Medusa", last_name: "Virani", hourly_rate: 41)
@store2.employees.create(first_name: "Norman", last_name: "Virani", hourly_rate: 41)
@store4.employees.create(first_name: "Katherine", last_name: "Virani", hourly_rate: 61)
@store5.employees.create(first_name: "Olla", last_name: "Virani", hourly_rate: 41)
@store6.employees.create(first_name: "Donald", last_name: "Virani", hourly_rate: 41)
@store1.employees.create(first_name: "ede", last_name: "Virani", hourly_rate: 50)

@store1.mens_apparel = false
@store1.womens_apparel = false
@store1.save