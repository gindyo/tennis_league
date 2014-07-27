class DashboardController < ApplicationController
  def index
     @user = current_user  
     @player =  current_user.player
     @ranking_points = RankingSystem.points_for @player
     @current_ranking = RankingSystem.player_rank @player
     @number_of_match_requests = MatchRequest.to_player(@player).count
     @player = PlayersHelper::PlayerViewModel.new current_user.player
  end
end
