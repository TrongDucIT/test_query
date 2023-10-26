class UserProfile < ActiveRecord::Base
  belongs_to :user
  scope :with_fn, -> (full_name) { where(full_name: full_name) }

  validates :phone_number, length: {minimum: 9}
end