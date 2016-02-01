class AddComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :song
      t.text :comment

      t.timestamps null: false 
    end 
  end
end
