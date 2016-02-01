class AddRatingToSongs < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user
      t.references :song
      t.integer :rating_point

      t.timestamps null: false 
    end
  end
end
