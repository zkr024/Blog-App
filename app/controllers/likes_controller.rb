class LikesController < ApplicationController
  def create
    like = Like.new(likes_params)
    like.save
    redirect_back(fallback_location: root_path)
  end

  private

  def likes_params
    params.require(:like).permit(:author_id, :post_id)
  end
end
