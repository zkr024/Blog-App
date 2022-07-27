class LikesController < ApplicationController
  before_action :authenticate_person!

  def create
    like = Like.new(likes_params)
    if like.save
      redirect_back(fallback_location: root_path)
    else
      puts 'error'
    end
  end

  private

  def likes_params
    params.require(:like).permit(:author_id, :post_id)
  end
end
