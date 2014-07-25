class MatchRequest < ActiveRecord::Base
  def requested_by= player
    from = player.id
  end
  def requested_by
    player from 
  end
  def request_to
    player to
  end
  def request_to= player
    self.to = player.id
    self.save
  end
  def self.to_player player
    self.where(to: player.id)   
  end

  private
  def player player_id
    Player.where{|p| p.player_id == player_id}
  end
end
