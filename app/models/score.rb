# Model to represent a score played by a golfer
# - total_score: total number of hits to finish all 18 holes
# - played_at: date when the score was played
class Score < ApplicationRecord
  belongs_to :user

  validates :total_score, inclusion: { in: 54..120 }
  validate :future_score

  def serialize
    {
      id: id,
      user_id: user_id,
      user_name: user.name,
      total_score: total_score,
      played_at: played_at,
    }
  end

  private

  def future_score
    errors.add(:played_at, 'must not be in the future') if played_at > Time.zone.today
  end
end
