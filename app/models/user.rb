class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_one :player
  def set_default_role
    self.role ||= :user
  end

  def get_player
    player || NilPlayer.new 
  end

end
