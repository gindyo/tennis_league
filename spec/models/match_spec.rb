require 'rails_helper'
require 'debugger'

RSpec.describe Match, :type => :model do
  before :each do 
     @home_court = HomeCourt.create
     @player = Player.create! home_court: @home_court
     @player1 = Player.create!
     @player1.ranking_points_entries << RankingPointsEntry.create!(points: 100, expire_on: Date.tomorrow)
     @player.ranking_points_entries << RankingPointsEntry.create!(points: 100, expire_on: Date.tomorrow)
     @visitorScore = MatchScore.create!({set1: 6, set2: 3})
     @hostScore = MatchScore.create!({set1: 7, set2:6})
     @visitor = Visitor.create!({player: @player, match_score: @visitorScore})
     @host = Host.create!({player:@player1, match_score: @hostScore})
     @match = Match.create!(visitor: @visitor, host: @host )
    
  end
  it 'returns the correct score' do 
     expect(@match.score).to eq "7 : 6, 6 : 3"    
  end
  it 'knows 2set winner' do 
     @visitorScore.update_attributes set1: 3, set2: 2
     @hostScore.update_attributes set1: 6, set2:6 
     expect(@match.winner).to be @host
  end 
  it 'knows 4set winner' do 
     @visitorScore.update_attributes set1: 3, set2: 6, set3: 6, set4: 6
     @hostScore.update_attributes set1: 6, set2:2, set3: 3, set4: 4
     expect(@match.winner).to be @visitor
  end
  it 'knows 3set winner' do 
     @visitorScore.update_attributes set1: 3, set2: 6, set3: 2
     @hostScore.update_attributes set1: 6, set2:2, set3: 6 
     expect(@match.winner).to be @host
  end
  it 'knows 5set winner' do 
     @visitorScore.update_attributes set1: 3, set2: 6, set3: 2, set4: 6, set5: 2
     @hostScore.update_attributes set1: 6, set2: 2, set3: 6, set4: 2, set5: 6
     expect(@match.winner).to be @host
     @visitorScore.update_attributes set1: 3, set2: 3, set3: 2, set4: nil, set5: nil
     @hostScore.update_attributes set1: 6, set2: 6, set3: 6, set4: nil, set5: nil
     expect(@match.winner).to be @host
     @visitorScore.update_attributes set1: 6, set2: 6, set3: 2, set4: 3, set5: 2
     @hostScore.update_attributes set1: 3, set2: 2, set3: 6, set4: 6, set5: 6
     expect(@match.winner).to be @host
  end
  it 'adjusts its participants points' do
    @match.adjust_points
    expect(@player1.points).to eq 110
    expect(@player.points).to eq 90
  end

end
