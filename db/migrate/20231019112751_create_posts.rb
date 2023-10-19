class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :Content
      t.datetime :PostTime
      t.timestamps
    end
  end
end
