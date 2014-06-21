class Player  < ActiveRecord::Base
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
    ranking_points_entries.select{|e| !e.expired? }.sum{|e| e.points}
  end
end
