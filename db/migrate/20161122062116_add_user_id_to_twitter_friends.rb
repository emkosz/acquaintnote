class AddUserIdToTwitterFriends < ActiveRecord::Migration
  def change
    add_column :twitter_friends, :user_id, :integer
    add_index :twitter_friends, :user_id
    add_foreign_key :twitter_friends, :users
  end
end
