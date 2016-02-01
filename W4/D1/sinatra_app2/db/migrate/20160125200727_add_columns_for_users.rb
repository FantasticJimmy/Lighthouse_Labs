class AddColumnsForUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :integer
    add_column :users, :email, :string
    add_column :users, :about_me, :text
  end
end
