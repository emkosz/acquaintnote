class TwitterFriends < ActiveRecord::Migration
  def change
    create_table :twitter_friends do |t|
      t.string :name
      t.string :twitter_handle
      t.integer :uid
      t.timestamps
    end
  end
end
