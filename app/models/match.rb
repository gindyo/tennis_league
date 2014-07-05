class Match < ActiveRecord::Base
  has_one :host
  has_one :visitor
  validates :visitor, :host, presence: true
  def winner
    return host if host_is_winner
    return visitor
  end
  def score
    score = "#{host.match_score.set1} : #{visitor.match_score.set1}, #{host.match_score.set2} : #{visitor.match_score.set2}" 
    score += ", #{host.match_score.set3} : #{visitor.match_score.set3}" if host.match_score.set3 
    score += ", #{host.match_score.set4} : #{visitor.match_score.set4}" if host.match_score.set4
    score += ", #{host.match_score.set5} : #{visitor.match_score.set5}" if host.match_score.set5
    score
  end
  def host_score
    host.match_score
  end
  def visitor_score
    visitor.match_score
  end

  def adjust_points
    if host_is_winner
      host.won_match_against visitor
    else 
      visitor.won_match_against host
    end
  end

  private
  def host_is_winner
    return ( host_score.set3 == nil && host_score.set2 > visitor_score.set2) || 
           ( host_score.set4 == nil && host_score.set3 > visitor_score.set3) || 
           ( host_score.set5 == nil && host_score.set4 > visitor_score.set4) || 
           ( host_score.set5 != nil && host_score.set5 > visitor_score.set5) 
  end
end
