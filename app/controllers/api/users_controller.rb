module Api
  # Controller that handles authorization and user data fetching
  class UsersController < ApplicationController
    include Devise::Controllers::Helpers
    before_action :logged_in!, only: [:show, :scores]
    before_action :validate_user_id, only: [:show, :scores]

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
      response = {
        user: {
          id: @user.id,
          name: @user.name
        },
      }

      render json: response.to_json
    end

    def scores
      scores = @user.scores.order(played_at: :desc)

      serialized_scores = scores.map(&:serialize)

      response = {
        scores: serialized_scores,
      }

      render json: response.to_json
    end

    private

    def validate_user_id
      @user = User.find_by(id: params[:id])

      return if !@user.nil?

      render json: {
        errors: [
          'The given user id was not found'
        ]
      }, status: :not_found
    end
  end
end
