class Post < ActiveRecord::Base
  has_many :user_post, dependent: :destroy
  validates :content, length: {minimum: 3}
end