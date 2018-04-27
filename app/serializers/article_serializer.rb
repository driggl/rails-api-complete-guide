class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :slug
end
