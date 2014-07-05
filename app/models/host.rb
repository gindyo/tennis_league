class Host < MatchParticipant
  def rate_opponent_sportmanship score
    visitor.sportmanship_score += score
    rater_score += score
  end
  

end
