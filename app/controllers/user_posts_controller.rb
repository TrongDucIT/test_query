class UserPostsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    # Trích xuất dữ liệu từ request
    post_params = params.permit(:content, :post_time, :user_id)

    # Lưu bài viết vào bảng Posts
    @post = Post.new(content: post_params[:content], post_time: post_params[:post_time])

    if @post.save
      # Lưu thông tin bài viết và người dùng vào bảng UserPosts
      user_post = UserPost.new(user_id: post_params[:user_id], post_id: @post.id)
      user_post.save

      render json: { message: 'Bài viết đã được đăng thành công' }, status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end


end
