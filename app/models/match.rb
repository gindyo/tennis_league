class Match < ActiveRecord::Base
  has_one :host
  has_one :visitor
  validates :visitor, :host, presence: true
  
  def score
    score = "#{host.match_score.set1} : #{visitor.match_score.set1}, #{host.match_score.set2} : #{visitor.match_score.set2}" 
    score += ", #{host.match_score.set3} : #{visitor.match_score.set3}" if host.match_score.set3 
    score += ", #{host.match_score.set4} : #{visitor.match_score.set4}" if host.match_score.set4
    score += ", #{host.match_score.set5} : #{visitor.match_score.set5}" if host.match_score.set5
    score
  end
end
