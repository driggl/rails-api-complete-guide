class UserAuthenticator
  attr_reader :authenticator, :access_token

  def initialize(code: nil, login: nil, password: nil)
    @authenticator = if code.present?
      Oauth.new(code)
    else
      Standard.new(login, password)
    end
  end

  def perform
    authenticator.perform

    set_access_token
  end

  def user
    authenticator.user
  end

  private

  def set_access_token
    @access_token = if user.access_token.present?
      user.access_token
    else
      user.create_access_token
    end
  end
end
