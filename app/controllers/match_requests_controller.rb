class MatchRequestsController < ApplicationController
  def create
    opponents = RankingSystem.get_opponents_for current_user.player
    if opponents.index{|x| x.id == match_request_params[:to].to_i} == nil
      flash[:error] = "oponnents is out of range"
      return redirect_to(opponents_path(current_user.player.id)) 
    end
    MatchRequest.create from: current_user.player, to: match_request_params[:to]
    flash[:success] = "Match request was created"
    redirect_to opponents_path(current_user.player.id)
  end
  def match_request_params
    params[:match_request].permit(:to)
  end
end
