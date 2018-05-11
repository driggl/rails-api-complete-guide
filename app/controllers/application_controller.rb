class ApplicationController < ActionController::API
  class AuthorizationError < StandardError; end

  rescue_from UserAuthenticator::AuthenticationError, with: :authentication_error
  rescue_from AuthorizationError, with: :authorization_error

  before_action :authorize!

  private

  def authorize!
    raise AuthorizationError unless current_user
  end

  def access_token
    provided_token = request.authorization&.gsub(/\ABearer\s/, '')
    @access_token = AccessToken.find_by(token: provided_token)
  end

  def current_user
    @current_user = access_token&.user
  end

  def authentication_error
    error = {
      "status" => "401",
      "source" => { "pointer" => "/code" },
      "title" =>  "Authentication code is invalid",
      "detail" => "You must provide valid code in order to exchange it for token."
    }
    render json: { "errors": [ error ] }, status: 401
  end

  def authorization_error
    error = {
      "status" => "403",
      "source" => { "pointer" => "/headers/authorization" },
      "title" =>  "Not authorized",
      "detail" => "You have no right to access this resource."
    }
    render json: { "errors": [ error ] }, status: 403
  end
end
