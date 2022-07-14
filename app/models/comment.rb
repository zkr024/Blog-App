class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post

  after_save :update_post_counter

  private

  def update_post_counter
    post.increment!(:comments_counter)
  end
end
