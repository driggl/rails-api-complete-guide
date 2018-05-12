class AccessToken < ApplicationRecord
  belongs_to :user
  after_initialize :generate_token

  validates :token, presence: true, uniqueness: true

  private

  def generate_token
    loop do
      break if token.present? && !AccessToken.where.not(id: id).exists?(token: token)
      self.token = SecureRandom.hex(10)
    end
  end
end
