class AddUserIdToFriends < ActiveRecord::Migration
  def change
  	add_column :friends, :user_id, :integer
  	add_index :friends, :user_id
  	add_foreign_key :friends, :users
  end
end
