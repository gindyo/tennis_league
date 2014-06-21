class Schedule < ActiveRecord::Base
  belongs_to :player
  has_many :matches, :through => :player
end
