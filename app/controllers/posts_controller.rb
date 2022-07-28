class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @comment = Comment.includes(:user)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.author_id = params[:user_id]

    if post.save
      redirect_to user_posts_path(params[:user_id])
    else
      redirect_to new_user_post_path
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy

    redirect_to user_path(params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
