class PostsController < ApplicationController
  before_action :authenticate_person!

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
    @user = current_person
  end

  def create
    post = Post.new(post_params)
    post.author_id = current_person.id

    if post.save
      redirect_to user_posts_path(current_person)
    else
      redirect_to new_user_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
