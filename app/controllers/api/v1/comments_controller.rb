class Api::V1::CommentsController < ApplicationController

  def index
    @comments = Comment.where(post_id: params[:post_id])

    render json: @comments
  end

  def create
    @comment = Post.find params[:post_id]
    @comment.comments.new comment_params

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :bad_request, message: 'Operation failed'
    end
  end

  private

    def comment_params
      params.permit(:text, :author_id, :body)
    end
end
