class PlayersController < ApplicationController

  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.all
  end

  def show
    Deb.print @player.user, :name    
    @player =  PlayersHelper::PlayerViewModel.new Player.find params[:id]
  end

  def new
    @player = Player.new
    @player.user_id = current_user.id
    @player = PlayersHelper::PlayerViewModel.new @player 
    @home_courts = home_courts
  end

  def edit
    @home_courts = home_courts
  end

  def create
    @player = Player.create(player_params)
    @player.user = current_user

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
   respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def opponents
    @opponents = RankingSystem.get_opponents_for(current_user.player).map{|x| PlayersHelper::PlayerViewModel.new x}
  end
   private
  def home_courts
    HomeCourt.all
  end

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:home_court_id, :user_id)
  end
end
class Deb
  def self.print var, meth = nil
    puts '######################################'
    puts '######################################'
    puts '######################################'
    if !var.nil?
      puts (var.send meth).to_s if !meth.nil?
      puts var.to_s if meth.nil?
    else
      puts 'Object is nil' 
    end
    puts '######################################'
    puts '######################################'
    puts '######################################'
  end
  
end
