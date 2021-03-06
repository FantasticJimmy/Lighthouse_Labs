require 'csv'
require 'pry'

# Represents a person in an address book.
class Contact

  attr_accessor :name, :email, :id

  def initialize(name, email, length)
    # TODO: Assign parameter values to instance variables.
    @name = name
    @email = email
    @id = length + 1
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      CSV.read("contacts.csv") 
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email, length)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      length = length 
      contact = Contact.new(name, email, length)
      File.open("contacts.csv","a") {|somefile| somefile.puts contact.id.to_s + "," + contact.name + "," + contact.email}
      return contact 
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      arr = []
      CSV.read("contacts.csv").each do |word|
        if word[0] == id
          arr = word
        end
      end
      arr
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      contents = CSV.read("contacts.csv")
      arr = contents.select do |line|
       line[1].match(term)
      end
      arr
    end
    
  end

end






