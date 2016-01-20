require 'pg'
require 'pry'
require 'active_record'
require './contact'

ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contact_list',
  username: 'development',
  password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)
puts 'CONNECTED'

puts 'Setting up Database (recreating tables) ...'
if ActiveRecord::Base.connection.table_exists?(:contacts) || ActiveRecord::Base.connection.table_exists?(:phones)
  puts "Using existing tables"
else
  ActiveRecord::Schema.define do
  drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
  drop_table :phones if ActiveRecord::Base.connection.table_exists?(:phones)
    create_table :contacts do |t|
      t.column :name, :string
      t.column :email, :string
      t.timestamps null: false
    end
    create_table :phones do |table|
      table.references :contact
      table.column :area_code, :integer
      table.column :number, :integer
      table.timestamps null: false
    end
  end
end

puts 'Setup DONE'

def show(param)
  puts "#{param.id} |#{param.name} |#{param.email} |#{param.created_at} |#{param.updated_at}"
end

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
      temp = Contact.find(gets.chomp.to_i)
      show(temp)
    when "update"
      Contact.update(gets.chomp.to_i,name: gets.chomp,email: gets.chomp)
      puts "Update completed."
    when "delete"
      Contact.destroy(gets.chomp.to_i)
    when "create"
      Contact.create(name: gets.chomp,email: gets.chomp)
    when "search"
      input = gets.chomp
      temp = Contact.where("name ~* ? or email ~* ?",input,input)
      temp.each do |result|
        show(result)
      end
    else
      puts "Unvalid operation."
  end
else
  case argv[0].downcase
    when "all"
      Contact.all
    when "find"
      temp = Contact.find(argv[1].to_i)
      show(temp)
    when "update"
      Contact.update(argv[1].to_i,name: argv[2],email: argv[3])
    when "delete"
      Contact.destroy(argv[1].to_i)
    when "create"
      Contact.create(name: argv[1],email: argv[2])
    when "search"
      temp = Contact.where("name ~* ? OR email  ~* ?",argv[1],argv[1])
      temp.each {|result|show(result)}
    else
      puts "Unvalid operation."
  end
end


