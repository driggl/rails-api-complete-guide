class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :avatar_url, :url, :name
end
