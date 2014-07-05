class Visitor < MatchParticipant
  def lost_match_to opponent
    player.lost_match_to opponent
  end
  def rate_opponent_sprtmanship score
    host.sportmanship_score += score
    rater_score += score
  end


end
