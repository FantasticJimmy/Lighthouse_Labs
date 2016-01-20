require './contact'
require 'pg'
require 'pry'

argv = []
argv = ARGV

if argv.empty?
  puts '-All show all'
  puts '-Find find by id'
  puts '-Update update an existing data'
  puts '-Delete delete an exisiting data'
  puts '-Create create a data'
  puts '-Search search by keyword'
  input = gets.chomp.downcase
  case input
    when "all"
      Contact.all
    when "find"
      Contact.find(gets.chomp.to_i)
    when "update"
      Contact.update(gets.chomp.to_i,gets.chomp,gets.chomp)
    when "delete"
      Contact.destroy(gets.chomp.to_i)
    when "create"
      Contact.create(gets.chomp,gets.chomp)
    when "search"
      Contact.search(gets.chomp)
    else
      puts "Unvalid operation."
  end
else
  case argv[0].downcase
    when "all"
      Contact.all
    when "find"
      Contact.find(argv[1].to_i)
    when "update"
      Contact.update(argv[1].to_i,argv[2],argv[3])
    when "delete"
      Contact.destroy(argv[1].to_i)
    when "create"
      Contact.create(argv[1],argv[2])
    when "search"
      Contact.search(argv[1])
    else
      puts "Unvalid operation."
  end
end
