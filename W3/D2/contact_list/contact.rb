class Contact

    attr_reader :name, :email, :id

  def self.connection
    @@connection ||= PG.connect( dbname: 'contact_list' )
  end

  def self.returning_my_objects(results)
    contacts = []
    results.each do |contact|
      new_contact = Contact.new(contact["name"],contact["email"],contact["id"])
      contacts << new_contact
    end
    contacts
  end

  def self.all
    results = connection.exec("SELECT * FROM contacts;")
    contacts = returning_my_objects(results)
    contacts.each do |contact|
      puts  "#{contact.id} #{contact.name} #{contact.email}"
    end
  end

  def self.create(name,email)
    current = Contact.new(name,email)
    current.save
    puts "Contact created!"
  end

  def self.find(id)
    contacts = []
    results = connection.exec_params("SELECT * FROM contacts WHERE id = $1",[id])
    if results.ntuples <= 0
      puts "Record is not found."
      nil
    else
      puts  "#{results[0]["id"]} #{results[0]["name"]} #{results[0]["email"]}"
      results
    end
  end

  def self.search(keyword_user)
    keyword = "%#{keyword_user}%"
    contacts = []
    results = connection.exec_params("SELECT * FROM contacts WHERE name LIKE $1 OR email LIKE $1;",[keyword])
    contacts = returning_my_objects(results)
    contacts.each do |contact|
      puts  "#{contact.id} #{contact.name} #{contact.email}"
    end
  end

  def self.update(id,new_name,new_email)
    result = Contact.find(id)
    if result
      current = Contact.new(new_name,new_email,result[0]["id"])
      current.save(id)
    else
      puts "Cannot update a record which was not found."
    end 
  end
    
  def save(id = nil)
    if id
      self.class.connection.exec_params("UPDATE contacts SET name = $1, email = $2 WHERE id = $3;",[self.name,self.email,self.id])
    else
    self.class.connection.exec_params("INSERT INTO contacts(name,email)VALUES($1,$2);",[self.name,self.email])
    end
  end

  def self.destroy(id)
    result = Contact.find(id)
    if result
      current = Contact.new(result[0]["name"],result[0]["email"],result[0]["id"])
      current.destroy
    else
      puts "Cannot delete a record which was not found."
    end
  end

  def destroy
    self.class.connection.exec_params("DELETE FROM contacts WHERE id = $1;",[self.id])
  end

  def initialize(name,email,id=nil)
    @name = name
    @email = email
    @id = id
  end

  private_class_method :returning_my_objects

end