class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to '/mypage'
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to '/mypage'
    else
      flash[:notice] = "投稿に失敗しました"
      redirect_to '/mypage'
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.user.id = current_user.id
    if @post.update(post_params)
      flash[:notice]="編集しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to '/mypage'
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :image, :video)
  end
end
