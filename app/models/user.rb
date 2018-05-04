class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  validates :provider, presence: true
end
