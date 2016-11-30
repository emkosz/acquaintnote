class AddTwitterBioToTwitterFriends < ActiveRecord::Migration
   def change
    add_column :twitter_friends, :twitter_bio, :string
  end
end
