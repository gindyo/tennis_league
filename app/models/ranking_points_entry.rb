class RankingPointsEntry < ActiveRecord::Base
  belongs_to :player
  validates_presence_of :expire_on
  def expired?
    expire_on < Date.today
  end
end
