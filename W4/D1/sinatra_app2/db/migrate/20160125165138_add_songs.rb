class AddSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :user
      t.string :title
      t.string :artist
      t.string :url

      t.timestamps null: false 
    end
  end
end
