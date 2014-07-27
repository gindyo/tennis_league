class RankingSystem
  def self.player_rank player
      throw 'Player not supplied' if player == nil
      return 'unranked' if !player || RankingSystem.points_for(player) == 0
      player_rank = current_rankings.index{|p|p.player_id == player.id} 
      player_rank += 1 if player_rank
      PlayerRank.new player_rank 
  end
  def self.points_for player
    points = 0
    RankingPointsEntry
      .where("expire_on > ? and player_id = ?", Date.yesterday, player.id)
      .each do |p|
        points += p.points
      end
    points
  end
  def self.rankings_table
    (current_rankings.map do |r|
      {r.player.id => r.points.to_s}
    end).to_a
  end
  def self.current_rankings
    RankingPointsEntry
        .group(:player_id)
        .where("expire_on > ?", Date.yesterday)
        .order('sum(points)  DESC')
        .select('player_id, sum(points) as points')
  end
  def self.get_opponents_for player
    current_rankings_local = current_rankings.map &:player_id
    return [] if current_rankings_local.empty?
    return sorted_opponents(current_rankings_local-[player.id]) if current_rankings_local.count < 10
    current_ranking_index = current_rankings_local.index player.id
    buffer = 5
    lower_bound = (current_ranking_index - buffer) < 0 ? 0 : current_ranking_index - buffer 
    upper_bound = current_ranking_index + buffer
    sorted_opponents(current_rankings_local.slice(lower_bound..upper_bound)) - [player]
  end
  private
  def self.sorted_opponents opponent_ids
    Player.find(opponent_ids).sort_by{|x|x.points}.reverse
  end
end
