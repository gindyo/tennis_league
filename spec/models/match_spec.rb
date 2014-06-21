require 'rails_helper'
require 'debugger'

RSpec.describe Match, :type => :model do
  it 'returns the correct score' do 
    home_court = HomeCourt.create
    player = Player.create home_court: home_court
    player1 = Player.create
    visitorScore = MatchScore.create({set1: 3, set2: 3})
    hostScore = MatchScore.create({set1: 6, set2:6})
    visitor = Visitor.create({player: player, match_score: visitorScore})
    host = Host.create({player:player, match_score: hostScore})
    match = Match.create(visitor: visitor, host: host )
    expect(match.score).to eq "6 : 3, 6 : 3"    
  end
end
