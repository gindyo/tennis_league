require 'rails_helper'

RSpec.describe Player, :type => :model do
  it 'has points' do 
    rp = RankingPointsEntry.new points: 3, expire_on: Date.tomorrow
    player = Player.new
    player.ranking_points_entries = [rp]
    expect(player.points).to eq 3
  end
end
