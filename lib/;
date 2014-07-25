class RankingSystem
  def self.player_rank player
      throw 'Player not supplied' if player == nil
      return 'unranked' if !player || player.ranking_points_entries.empty?
      player_rank = current_rankings.index{|p|p.player_id == player.id} 
      player_rank += 1 if player_rank
      PlayerRank.new player_rank 
  end
  def self.rankings_table
    (current_rankings.map do |r|
      {r.player.id => r.points.to_s}
    end).to_a
  end
  def self.current_rankings
    RankingPointsEntry
        .group(:player_id)
        .where("expire_on > ?", Date.today)
        .order('sum(points)  DESC')
        .select('player_id, sum(points) as points')
  end
  def self.get_opponents_for player
    current_rankings_local = current_rankings.map &:player_id
    return [] if current_rankings_local == []
    current_ranking_index = current_rankings_local.index player.id
    last_index = current_rankings_local.count - 1
    buffer = 5
    upper_bound_opponent_index = current_ranking_index + buffer
    upper_bound_opponent_index =  current_rankings_local[last_index] if upper_bound_opponent_index > last_index  
    lower_bound_index = current_ranking_index - buffer
    lower_bound_index = 0 if lower_bound_index < 0
    opponent_ids = current_rankings_local[lower_bound_index..upper_bound_opponent_index]
    opponent_ids.delete player.id
    Player.find(opponent_ids).sort_by{|x|x.points}.reverse
  end
end
