describe 'Ranking System' do 
  it 'returns unranked player\'s ranking' do
    player_rank = RankingSystem.player_rank(Player.new)
    expect(player_rank).to eq 'unranked'
  end

  before :each  do 
    @player = Player.create(user: User.new(:name =>'dimitar'))
    @player2 = Player.create(user: User.new(:name =>'milena'))
    @player3 = Player.create(user: User.new(:name =>'ivo'))
    @rp1 = RankingPointsEntry.create player: @player, points: 33, expire_on: Date.tomorrow
    @rp2 = RankingPointsEntry.create player: @player2, points: 100, expire_on: Date.tomorrow
    @rp3 = RankingPointsEntry.create player: @player3, points: 11, expire_on: Date.tomorrow
  end
 it 'calculates ranking correctly' do
    debugger
     expect(RankingSystem.player_rank @player3).to eq PlayerRank.new 3
     expect(RankingSystem.player_rank @player2).to eq PlayerRank.new 1
     expect(RankingSystem.player_rank @player).to eq PlayerRank.new 2
 end
 it 'adds points correctly' do 
     @player3.ranking_points_entries << (RankingPointsEntry.create points: 200, expire_on: Date.tomorrow)
     expect(RankingSystem.player_rank @player3).to eq PlayerRank.new 1 
 end
 it 'drops points that have expired' do
    @player2.ranking_points_entries.first.update_attribute(:expire_on, Date.yesterday)
    expect(RankingSystem.player_rank(@player2).to_s).to eq 'unranked' 
    RankingPointsEntry.create player: @player2 , points: 102, expire_on: Date.yesterday
    RankingPointsEntry.create player: @player2, points: 20, expire_on: Date.tomorrow
    RankingPointsEntry.create player: @player2, points: 2, expire_on: Date.tomorrow
    RankingPointsEntry.create player: @player2, points: 2, expire_on: Date.tomorrow
    expect(RankingSystem.player_rank(@player2).to_s).to eq '2' 
 end

 it 'returns complete rankings table' do 
    expect(RankingSystem.rankings_table).to eq [{2=>"100.0"}, {1=>"33.0"} ,{3=>"11.0"}]
 end
 it "returns player's opponents" do 
    players = []
    15.times do 
      players << player = Player.create(user: User.new(:name =>'dimitar'))
      RankingPointsEntry.create player: player, points: (200+player.id ), expire_on: Date.tomorrow
    end
    player = players.delete_at(8)
    expect(RankingSystem.get_opponents_for(player)).to eq players[3..12].reverse
 end
 it "returns player's opponents" do 
    players = []
    15.times do 
      players << player = Player.create(user: User.new(:name =>'dimitar'))
      RankingPointsEntry.create player: player, points: (200-player.id ), expire_on: Date.tomorrow
    end
    player = players.delete_at(8)
    expect(RankingSystem.get_opponents_for(player)).to eq players[3..12]
 end
 it "does not blow up if there are no players" do
   RankingPointsEntry.all.map &:destroy
   expect(RankingSystem.get_opponents_for(@player)).to eq []
 end

end 
