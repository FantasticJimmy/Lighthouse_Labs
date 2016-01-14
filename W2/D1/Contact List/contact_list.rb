require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.

  def self.format_out(arr)
    arr.each do |x|
    puts "#{x[0]}: #{x[1]} (#{x[2]})"
    end
  end

  def self.list
    arr = Contact.all
    arr.each do |x|
    puts "#{x[0]}: #{x[1]} (#{x[2]})"
    end
  end

  def self.show(flag)
    flag = flag
    arr = Contact.find(flag)
    puts "#{arr[0]}: #{arr[1]} (#{arr[2]})"
  end

  def self.begin(argv)
    # binding.pry
    if argv != []
      case argv[0]
        when "list"
          ContactList.list
        when "new"
          first_name = argv[1]
          last_name = argv[2]
          full_name = first_name + " " + last_name
          email = argv[3]
          length = CSV.read('contacts.csv').length
          Contact.create(full_name,email, length)
          puts "Completed!"
        when "show"
          flag = argv[1]
          puts ContactList.show(flag)
        when "search"
          keyword = argv[1]
          arr = Contact.search(keyword)[0]
          puts "#{arr[0]}: #{arr[1]} (#{arr[2]})"
        else
          puts "Invalid command"
      end
    else
      puts "Here is a list of avaibale commands:"
      puts "new    - Create a new contact"
      puts "list   - List all contacts"
      puts "show   - Show a contact"
      puts "search - Search contacts"
      command = gets.chomp
      case command
        when "list"
          ContactList.list
        when "new"
          puts "What is the full name?"
          full_name = gets.chomp
          email = gets.chomp
          length = CSV.read('contacts.csv').length
          Contact.create(full_name,email, length)
        when "show"
          flag = gets.chomp
          puts ContactList.show(flag)
        when "search"
          keyword = gets.chomp
          new_arr = Contact.search(keyword)[0]
          puts "#{new_arr[0]}: #{new_arr[1]} (#{new_arr[2]})"
        else
          puts "Invalid command"
      end
    end
  end
end
argv = ARGV
ContactList.begin(argv)