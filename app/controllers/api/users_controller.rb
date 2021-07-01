module Api
  # Controller that handles authorization and user data fetching
  class UsersController < ApplicationController
    include Devise::Controllers::Helpers

    before_action :logged_in!, only: [ :feed ]

    def login
      user = User.find_by('lower(email) = ?', params[:email])

      if user.blank? || !user.valid_password?(params[:password])
        render json: {
          errors: [
            'Invalid email/password combination'
          ]
        }, status: :unauthorized
        return
      end

      sign_in(:user, user)

      render json: {
        user: {
          email: user.email,
          name: user.name,
          token: current_token
        }
      }.to_json
    end

    def feed
      Rails.logger.info 'Not implemented'
    end

    private

    def current_token
      request.env['warden-jwt_auth.token']
    end
  end
end
