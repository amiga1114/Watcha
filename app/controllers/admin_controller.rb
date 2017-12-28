class AdminController < ApplicationController
  def index
    @users = User.all
  end

  def posts
    @posts = Post.all
  end

  def posts_destroy
    # 특정 게시글을 지운다
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :back
  end

  def reviews
    @reviews = Review.all
  end

  def reviews_destroy
    # 특정 review을 지운다
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back
  end

  def to_manager
    @user = User.find(params[:id])
    @user.update(
      role: "manager"
    )
    redirect_to :back, notice: "승급함"
  end

  def to_user
    @user = User.find(params[:id])
    @user.update(
      role: "user"
    )
    redirect_to :back, notice: "추방함"
  end
end
