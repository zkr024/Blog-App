class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text
  belongs_to :user
  has_many :comments
end
