class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).where(author_id: params[:user_id])
  end

  def show
    @post = Post.includes(:user, :comments).find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    post = Post.new(post_params)
    post.author_id = current_user.id

    if post.save
      redirect_to user_posts_path(current_user)
    else
      redirect_to new_user_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
