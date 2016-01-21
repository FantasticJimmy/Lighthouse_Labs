class CreateTeachers < ActiveRecord::Migration
  
  def change
    # Add code to create the table here
    # HINT: check out ActiveRecord::Migration.create_table
    create_table :teachers do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :address, :string
      t.column :phone, :string
      t.timestamps null: false

      # column definitions go here
      # Use the AR migration guide for syntax reference
    end
  end

end
