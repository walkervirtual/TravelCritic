class AddOtheThingsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :fname, :string
  	add_column :users, :lname, :string
  	add_column :users, :email, :string
  	add_column :users, :password, :string
  	add_column :users, :username, :string
  	add_column :users, :password_confirmation, :string
  end
end
