class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    user.increment!(:post_counter)
  end
end
