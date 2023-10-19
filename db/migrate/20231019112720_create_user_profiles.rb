class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :FullName
      t.string :Address
      t.string :PhoneNumber
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
