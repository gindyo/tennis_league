class MatchParticipant < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
  has_one :match_score
end
