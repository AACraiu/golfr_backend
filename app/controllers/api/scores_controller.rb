module Api
  # Controller that handles CRUD operations for scores
  class ScoresController < ApplicationController
    before_action :logged_in!

    def user_feed
      scores = Score.all.order(played_at: :desc, id: :desc)
      serialized_scores = scores.map(&:serialize)

      response = {
        scores: serialized_scores,
      }

      render json: response.to_json
    end

    def create
      score = current_user.scores.build(score_params)

      if score.save
        render json: {
          score: score.serialize
        }
      else
        render json: {
          errors: score.errors.messages
        }, status: :bad_request
      end
    end

    private

    def score_params
      params.require(:score).permit(:total_score, :played_at)
    end
  end
end
