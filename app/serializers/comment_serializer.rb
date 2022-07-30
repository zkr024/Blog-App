class CommentSerializer < ActiveModel::Serializer
  attributes :author_id, :text
  belongs_to :post
  belongs_to :user
end
