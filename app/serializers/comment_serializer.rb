class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :article
  has_one :user
end
