class HomeCourt < ActiveRecord::Base
  has_many :players
  has_one :location
end
