class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.integer :relationship
      t.date :added_date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
