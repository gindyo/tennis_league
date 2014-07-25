class Player  < ActiveRecord::Base
  include Nullable
  belongs_to :home_court
  belongs_to :user
  has_one :schedule
  has_many :match_participants
  has_many :matches, :through => :schedule
  has_many :ranking_points_entries
  def name 
    user.name
  end 
  def points
    ranking_points_entries.select{|e| !e.expired? }.sum{|e| e.points} || 0
  end
  def won_match_against player
    lost_points = player.points * 0.1
    ranking_points_entries << RankingPointsEntry.create( player: self, points: lost_points, expire_on: 30.days.from_now)
    player.ranking_points_entries << RankingPointsEntry.create(player: player, points: -lost_points, expire_on: 30.days.from_now)
  end
  def matches_played
    matches.count
  end
  def average_rater_score
    rater_score / matches_played
  end
  def average_sportmanship_score
    sportmanship_score / matches_played
  end
end
