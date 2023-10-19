class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.integer :Relationship
      t.date :AddedDate
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
