class PlayersController < ApplicationController

  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player =  PlayersHelper::PlayerViewModel.new Player.find params[:id]
  end

  # GET /players/new
  def new
    @player = Player.new
    @player.user_id = current_user.id
    @home_courts = home_courts
  end

  # GET /players/1/edit
  def edit
    @home_courts = home_courts
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.create(player_params)

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

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
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

  # DELETE /players/1
  # DELETE /players/1.json
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
  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def player_params
    params.require(:player).permit(:home_court_id, :user_id)
  end
end
