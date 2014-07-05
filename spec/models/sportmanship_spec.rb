describe Sportmanship do 
  it 'responds to whiner_score' do 
    expect(Sportmanship.new).to respond_to :whiner_score
  end
  it 'responds to cheeter_score' do 
    expect(Sportmanship.new).to respond_to :cheeter_score
  end
  it 'responds to player' do 
    expect(Sportmanship.new).to respond_to :player
  end
  
  it 'calculates cheeter score' do 
    player = instance_double Player, matches_played: 10
    sportmanship = Sportmanship.new 
    sportmanship.selfish_calls = 34.0
    sportmanship.selfless_calls = 2.0
    sportmanship.player = player
    expect(sportmanship.cheeter_score).to eq 8
  end
end
