class AddFieldsToFriends < ActiveRecord::Migration
  def change
    rename_column :friends, :name, :first_name
    rename_column :friends, :note, :description
    add_column :friends, :last_name, :string
    add_column :friends, :phone_number, :string
    add_column :friends, :email, :string
    add_column :friends, :twitter_url, :string
    add_column :friends, :facebook_url, :string
  end
end
