class MatchParticipant < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
  has_one :match_score
  def won_match_against match_participant
    player.won_match_against match_participant.player
  end
  def points
    player.points
  end
  def visitor
    match.visitor
  end
  def host
    match.host
  end
  def rater_score= score
    player.rater_score += score
  end
  def sportmanship_score= score
    player.sportmanship_score += score
  end
end
