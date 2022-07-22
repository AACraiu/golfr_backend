module Api
  # Controller that handles authorization and user data fetching
  class UsersController < ApplicationController
    include Devise::Controllers::Helpers

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
          id: user.id,
          email: user.email,
          name: user.name,
          token: current_token
        }
      }.to_json
    end

    def show
      user = User.find_by(id: params[:id])

      if user.nil?
        response = {
          error: "user does not exist",
        }

        render json: response.to_json
        return
      end

      scores = user.scores

      response = {
         name: user.name,
         scores: scores
       }

       render json: response.to_json

    end
  end
end
