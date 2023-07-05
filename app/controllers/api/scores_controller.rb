module Api
  # Controller that handles CRUD operations for scores
  class ScoresController < ApplicationController
    before_action :logged_in!
    before_action :validate_score_user_id, only: :destroy

    def show_scores
      user = User.find_by(id: params[:id])
      if user
        scores = user.scores.order(played_at: :desc, id: :desc).includes(:user).map(&:serialize)
        render json: {
          scores: scores,
          name: user.name
        }
      else
        render json: {
          errors: 'no valid user with this id'
        }, status: :bad_request
      end
    end

    def user_feed
      scores = Score.all.order(played_at: :desc, id: :desc).includes(:user)
      serialized_scores = scores.map(&:serialize)

      response = {
        scores: serialized_scores,
      }

      render json: response.to_json
    end

    private

    def score_params
      params.require(:score).permit(:total_score, :played_at)
    end

    def validate_score_user_id
      @score = Score.find(params[:id])

      return if @score.user_id == current_user.id

      render json: {
        errors: [
          'Score does not belong to user'
        ]
      }, status: :unauthorized
    end
  end
end
