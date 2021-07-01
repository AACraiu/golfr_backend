module Api
  # Controller that handles CRUD operations for scores
  class ScoresController < ApplicationController
    before_action :logged_in!

    def user_feed
      scores = Score.all.order(played_at: :desc, id: :desc)
      serialized_scores = scores.map do |score|
        {
          id: score.id,
          user_id: score.user_id,
          user_name: score.user.name,
          total_score: score.total_score,
          played_at: score.played_at,
        }
      end

      response = {
        scores: serialized_scores,
      }

      render json: response.to_json
    end
  end
end
