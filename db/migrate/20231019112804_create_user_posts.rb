class CreateUserPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_posts do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
