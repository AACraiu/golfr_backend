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

  def user_name
    user = User.find(params[:id])
    response = {
      name: user.name,
    }
    render json: response.to_json
  end

  def user_scores
    scores = Score.where( user_id: params[:id])
    response = {
      scores: scores,
    }
    render json: response.to_json
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
