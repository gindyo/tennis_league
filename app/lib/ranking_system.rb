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
end
