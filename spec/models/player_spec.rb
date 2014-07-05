require 'rails_helper'

RSpec.describe Player, :type => :model do

  it 'is at duck' do
      [:average_rater_score, :matches_played, :points, :average_sportmanship_score,].each do |m|
      expect(Player.new).to respond_to(m)
    end

  end
  
  it 'has points' do 
    rp = RankingPointsEntry.new points: 3, expire_on: Date.tomorrow
    player = Player.new
    player.ranking_points_entries = [rp]
    expect(player.points).to eq 3
  end
  it 'wins a match' do 
    me = Player.create 
    opponent = Player.create 
    opponent.ranking_points_entries << RankingPointsEntry.create(points: 100, expire_on: 10.days.from_now)
    me.won_match_against opponent
    expect(me.points).to eq 10
    expect(opponent.points).to eq 90
  end  
end
