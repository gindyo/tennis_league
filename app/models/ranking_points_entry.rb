class RankingPointsEntry < ActiveRecord::Base
  belongs_to :player
  def expired?
    expire_on < Date.today
  end
end
