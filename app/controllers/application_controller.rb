# Base class for Rails controllers
class ApplicationController < ActionController::API
  include Devise::Controllers::Helpers

  def logged_in!
    return if current_user.present?

    render json: {
      errors: [
        'User not logged in'
      ]
    }, status: :unauthorized
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
