class DashboardController < ApplicationController
  def index
     @user = current_user  
     @player = PlayersHelper::PlayerViewModel.new current_user.player
     @ranking_points = @player.points 
     @current_ranking = RankingSystem.player_rank @player
     @number_of_match_requests = MatchRequest.to_player(@player).count
  end
end
