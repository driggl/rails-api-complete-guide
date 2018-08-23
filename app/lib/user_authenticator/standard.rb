class UserAuthenticator::Standard < UserAuthenticator
  class AuthenticationError < StandardError; end

  def initialize(login, password)

  end

  def perform
    raise AuthenticationError
  end
end
