class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def recent_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end