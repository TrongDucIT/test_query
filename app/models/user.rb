# frozen_string_literal: true

class User < ActiveRecord::Base
  include ActiveModel::API
  has_one :user_profile  # Quan hệ has_one với Bảng Thông tin cá nhân (UserProfile)
  has_many :friend  # Quan hệ has_many với Bảng Danh sách bạn (Friend)
  has_many :user_post # Quan hệ has_many thông qua Bảng UserPost với Bảng Bài viết (Post)

  # scope :by_email, -> (email) { where(email: email) }
  #
  attr_accessor :user_name, :email, :password
  validates :user_name, :email, :password
  #
  # #scope long nhau
  # scope :long_email, -> { where("LENGTH(email) > 10") }
  # scope :p_not, -> {long_email.where.not(password: nil) }
  #
  # #scope đối số
  # scope :sc_doiso, ->(email) { where("LENGTH(email) > ?", email) }
  # #
  #
  # #scope điều kiện
  # scope :sc_dieukien, ->(length) { where("LENGTH(email) > ?", length) if length.present? }
  #
  # #scope mặc định
  # default_scope -> { select(:user_name, :email, :password) }

  #unscoped.all / unscoped {User.all}
end



# # Kiểm tra email
# email_check = 'user1@example.com'
# users_email = User.by_email(email_check)
#
# if users_email.any?
#   users_email.each do |user|
#     puts "Tìm thấy người dùng với email #{email_check}: #{user.inspect}"
#   end
# else
#   puts "Không có người dùng nào có email #{email_check}"
# end

