class PlayerRank
  attr_accessor :rank
  def initialize r
    @rank = r
  end
  def to_s
    return 'unranked' if @rank.nil?
    @rank.to_s
  end

  def == rank
    rank.rank == @rank
  end

end
