class UsersController < ApplicationController
  def mypage
    if user_signed_in?
      @user = current_user
      @post = Post.new
      @posts = @user.posts
    else
      redirect_to new_user_session_path, alert: 'ログインしてください'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
      @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/', notice: "ユーザーを削除しました。"
  end

  
  
end
