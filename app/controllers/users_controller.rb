class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy, :update]

  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.valid?
  #     @user.save
  #     render json: @user
  #     puts 'OK nhá Bro !!!'
  #   else
  #     render json: { errors: @user.errors.merge(@user.user_profile.errors) }, status: :unprocessable_entity
  #   end
  # end

  def create
    User.transaction do
      @user = User.new(user_params)
      @user_profile = UserProfile.new(user_profile_params)

      if @user.valid?
        @user.save
        @user_profile.user = @user
        @user_profile.save

        render json: @user
      else
        render json: { message: 'Lỗi !!!' }
      end
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user
      User.transaction do
        if @user.update(user_params) && @user.user_profile.update(user_profile_params)
          render json: @user
        else
          render json: { message: 'Lỗi !!! Nhưng mà đell biết lỗi gì á' }
        end
      end
    else
      render json: { error: 'Không tìm thấy người dùng' }, status: :not_found
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      User.transaction do
        user.user_profile.destroy if user.user_profile # Kiểm tra nếu user_profile tồn tại thì xóa nó

        user.destroy
        render json: { message: 'Người dùng và thông tin cá nhân đã được xóa thành công' }
      end
    else
      render json: { error: 'Không tìm thấy người dùng' }, status: :not_found
    end
  end

  private

  def user_params
    params.permit(:user_name, :password, :email)
  end

  def user_profile_params
    params.permit(:full_name, :address, :phone_number)
  end
end
