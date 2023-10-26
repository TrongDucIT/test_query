# frozen_string_literal: true

class User < ActiveRecord::Base
  # include ActiveModel::API
  has_one :user_profile, dependent: :destroy # Quan hệ has_one với Bảng Thông tin cá nhân (UserProfile)
  has_many :friend, dependent: :destroy  # Quan hệ has_many với Bảng Danh sách bạn (Friend)
  has_many :user_post, dependent: :destroy # Quan hệ has_many thông qua Bảng UserPost với Bảng Bài viết (Post)
  validates :email, length: {minimum: 6} #maximun / in / is(độ dài phải bằng cái trong ís)

  # acceptance: sử dụng khi người dùng cần đồng ý với điều khoản dịch vụ của ứng dụng
  # confirmation: khi có hai trường văn bản sẽ nhận được nội dung giống hệt nhau
  # comparison: xác thực sự so sánh giữa hai giá trị có thể so sánh được.
              #- :greater_than : phải lớn hơn
              #- :greater_than_or_equal_to : phải lớn hơn hoặc bằng
              #- :equal_to : phải bằng
              #- :less_than : pahir nhỏ hơn
              #- :less_than_or_equal_to : phải nhỏ hơn hoặc bằng
              #- : other_than : phải khác
  # format: kiểm tra xem chúng có khớp với một biểu thức chính quy hay không, được chỉ định bằng tùy chọn :with/ :without.
  # inclusion: xác nhận rằng các giá trị của thuộc tính được bao gồm trong một tập hợp
  # exclusion: ngược lại với inclusion
  # numericality: thuộc tính chỉ có giá trị số(nó không cho phép nil, nếu muốn có thể dùng allow_nil: true)
              # bao gồm những ràng buộc của comparison
              # :in : phải là số lẻ
              # :even : phải là số chẵn
  # presence: các thuộc tính được chỉ định không trống.
  # absence: kiểm tra xem giá trị không phải là nil hay một chuỗi trống / khoảng trắng.
  # uniqueness: xác thực rằng giá trị của thuộc tính là duy nhất ngay trước khi đối tượng được lưu.
  # validates_associated: khi mô hình có các liên kết luôn cần được xác thực.

  #:allow_nil: Bỏ qua xác thực nếu thuộc tính là nil.
  # :allow_blank: Bỏ qua xác nhận nếu thuộc tính trống.
  # :message: Chỉ định một thông báo lỗi tùy chỉnh.
  # :on: Chỉ định bối cảnh nơi xác thực này được kích hoạt.
  # :strict: Đưa ra một ngoại lệ khi xác thực không thành công.
  # :ifvà:unless : Chỉ định khi nào việc xác nhận nên hoặc không nên xảy ra.





  # # scope :by_email, -> (email) { where(email: email) }
  #
  # attr_accessor :user_name, :email, :password
  # validates :user_name, :email, :password
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





