class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.text :note

      t.timestamps null: false
    end
  end
end
