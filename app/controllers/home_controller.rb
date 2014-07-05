class HomeController < ApplicationController
  def index
    @player = current_user.get_player
  end
end
