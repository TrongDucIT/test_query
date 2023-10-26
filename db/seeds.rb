# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Bảng Người dùng (Users)
User.create(user_name: 'user1', password: 'password1', email: 'user1@example.com')
User.create(user_name: 'user2', password: 'password2', email: 'user2@example.com')
User.create(user_name: 'user3', password: 'password3', email: 'user3@example.com')
User.create(user_name: 'user4', password: 'password4', email: 'user4@example.com')
User.create(user_name: 'user5', password: 'password5', email: 'user5@example.com')

# Bảng Thông tin cá nhân (UserProfile)
UserProfile.create(full_name: 'John Doe', address: '123 Main St', phone_number: '123-456-7890', user_id: 1)
UserProfile.create(full_name: 'Jane Smith', address: '456 Elm St', phone_number: '987-654-3210', user_id: 2)
UserProfile.create(full_name: 'Alice Johnson', address: '789 Oak St', phone_number: '555-123-4567', user_id: 3)
UserProfile.create(full_name: 'Bob Brown', address: '101 Pine St', phone_number: '333-888-7777', user_id: 4)
UserProfile.create(full_name: 'Eve White', address: '999 Birch St', phone_number: '222-999-1111', user_id: 5)

# # Bảng Danh sách bạn (Friend)
# Friend.create(relationship: 1, added_date: '2023-10-01', user_id: 1)
# Friend.create(relationship: 1, added_date: '2023-10-02', user_id: 2)
# Friend.create(relationship: 1, added_date: '2023-10-03', user_id: 3)
# Friend.create(relationship: 1, added_date: '2023-10-04', user_id: 4)
# Friend.create(relationship: 1, added_date: '2023-10-05', user_id: 5)

# Bảng Bài viết (Post)
Post.create(content: 'This is the first post.', post_time: '2023-10-01 12:00:00')
Post.create(content: 'Hello, world!', post_time: '2023-10-02 14:30:00')
Post.create(content: 'Rails is awesome!', post_time: '2023-10-03 10:15:00')
Post.create(content: 'Testing the post feature.', post_time: '2023-10-04 17:45:00')
Post.create(content: 'My latest update.', post_time: '2023-10-05 20:00:00')

# Bảng UserPost (Bảng nối cho quan hệ nhiều-nhiều)
UserPost.create(user_id: 1, post_id: 1)
UserPost.create(user_id: 2, post_id: 2)
UserPost.create(user_id: 3, post_id: 3)
UserPost.create(user_id: 4, post_id: 4)
UserPost.create(user_id: 5, post_id: 5)
UserPost.create(user_id: 1, post_id: 5)


# find
def find_id(user_id)
  begin
    user = User.find(user_id)
    puts "Tìm thấy người dùng với ID #{user.id}: #{user.user_name}"
  rescue
    puts "Không tìm thấy người dùng với ID #{user_id}"
  end
end

# find_by
def find_by_id(user_id)
  user = User.find_by(id: user_id)

  if user
    puts "Tìm thấy id: #{user.id}: #{user.user_name}"
  else
    puts "Không tìm thấy id: #{user_id}"
  end
end

# take
def t_take(limit)
  # Kiểm tra giá trị truyền vào
  if limit < 0
    puts "Số lượng cần lấy phải là một số không âm."
  else
    limit = [limit, User.count].min
    # Sử dụng phương thức take với giá trị đã kiểm tra
    users = User.take(limit)

    puts "Lấy được #{users.length} người dùng."
    users.each do |user|
      # Xử lý kết quả ở đây nếu cần
      puts "ID: #{user.id}, Username: #{user.user_name}, Email: #{user.email}"
    end
  end
end

# first
def custom_first(limit)
  if limit < 1
    puts "Số lượng cần lấy phải là một số dương lớn hơn 0."
  else
    # Sử dụng phương thức first để lấy bản ghi đầu tiên
    user = UserPost.first

    if user
      puts "Thông tin người dùng:"
      puts "ID: #{user.id}, Username: #{user.user_id}, Email: #{user.post_id}"
    else
      puts "Không có bản ghi người dùng nào trong cơ sở dữ liệu."
    end
  end
end

# last
def custom_last(limit)
  if limit < 1
    puts "Số lượng cần lấy phải là một số dương lớn hơn 0."
  else
    # Sử dụng phương thức first để lấy bản ghi đầu tiên
    user = UserPost.last

    if user
      puts "Thông tin người dùng:"
      puts "ID: #{user.id}, Username: #{user.user_id}, Email: #{user.post_id}"
    else
      puts "Không có bản ghi người dùng nào trong cơ sở dữ liệu."
    end
  end
end

find_each
def fe_basic
  User.find_each do |us|
    if us.respond_to?(:Username) # Kiểm tra trường có tồn tại
      puts us.user_name
    else
      puts "Làm gì có trường"
    end
  end
end
#
#
def fe_batch_size
  User.find_each(batch_size: 6) do |us|
    if us.respond_to?(:Username) # Kiểm tra trường có tồn tại
      puts us.user_name
    else
      puts "Làm gì có cột"
    end
  end
end

def display_data(batch_size)
  if batch_size> 0
    User.find_each(batch_size: batch_size) do |user|
      if user.respond_to?(:pass) # Kiểm tra trường có tồn tại
        puts user.user_name
      else
        puts "Làm gì có cột đấy, ngu vl ! \nĐọc db đi"
        break
      end
    end
  else
    puts "Batch size không hợp lệ"
  end
end

def custom_limit(so)
  if so < 1
    puts "Số lượng cần lấy phải là một số dương lớn hơn 0."
  else
    users = User.limit(so).to_a # Thực hiện truy vấn và chuyển kết quả thành mảng
    users.each do |user|
      puts user.inspect # In thông tin về từng bản ghi
    end
  end
end


def group_basic
  users = UserPost.select(:user_id).group(:user_id)

  users.each do |u|
    if u.respond_to?(:user_id) # Kiểm tra trường có tồn tại
      puts u.user_id
    else
      puts "Làm gì có cột đấy"
    end
  end
end

def query(user_id)
  @user_post = UserPost.where(user_id: user_id)
  @user_post.each do |m|
    puts "#{m.id} - #{m.user.user_name}"
  end
  # nil
end

def query_in
  @user_posts = UserPost.includes(:user)
  @user_posts.each do |user_post|
    # puts "#{user_post.id} - #{user_post.user.user_name}"
    user_post.user_id = 1
    user_post.save
  end
end

def query_pl
  @user_posts = UserPost.preload(:user)
  @user_posts.each do |user_post|
    # puts "#{user_post.id} - #{user_post.user.user_name}"
    # puts @user_post
    user_post.user_id = 1
    user_post.save
  end
end

# Thứ tự thực hiện truy vấn:
#   Khi sử dụng includes, truy vấn SQL cho mối quan hệ được thực hiện sau khi truy vấn ban đầu được hoàn tất.
#   Khi sử dụng preload, các truy vấn SQL cho tất cả các mối quan hệ được thực hiện cùng lúc, không cần phải chờ truy vấn ban đầu hoàn tất.