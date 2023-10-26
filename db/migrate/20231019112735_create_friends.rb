class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.integer :relationship
      t.references :user, foreign_key: true
      t.integer :friend_id
      t.date :added_date
      t.timestamps
    end
  end
end

# ------------------------------------------------------------------------------
# def create(action)
#   user1 = User.find_by(user_name: 'user1')
#   user2 = User.find_by(user_name: 'user2')
#
#   if user1 && user2
#     # Kiểm tra xem mối quan hệ bạn bè đã tồn tại hay chưa
#     friendship = Friend.find_by(user_id: user1.id, friend_id: user2.id)
#
#     if action == 1
#       if friendship
#         # Cập nhật mối quan hệ bạn bè thành 1 nếu đã tồn tại
#         friendship.update(relationship: 1)
#         puts "Mối quan hệ bạn bè đã được tạo."
#       else
#         Friend.create(user_id: user1.id, friend_id: user2.id, relationship: 1, added_date: Date.today)
#         puts "Mối quan hệ bạn bè đã được tạo."
#       end
#     elsif action == 0
#       if friendship
#         # Cập nhật mối quan hệ bạn bè thành 0 nếu đã tồn tại
#         friendship.update(relationship: 0)
#         puts "Mối quan hệ bạn bè đã bị hủy."
#       else
#         puts "Mối quan hệ bạn bè không tồn tại."
#       end
#     else
#       puts "Hành động không hợp lệ. Sử dụng 1 để tạo và 0 để hủy."
#     end
#   else
#     puts "Người dùng không tồn tại."
#   end
# end
