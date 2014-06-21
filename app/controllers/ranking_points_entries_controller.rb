class RankingPointsEntriesController < ApplicationController
  before_action :set_ranking_points_entry, only: [:show, :edit, :update, :destroy]

  # GET /ranking_points_entries
  # GET /ranking_points_entries.json
  def index
    @ranking_points_entries = RankingPointsEntry.all
  end

  # GET /ranking_points_entries/1
  # GET /ranking_points_entries/1.json
  def show
  end

  # GET /ranking_points_entries/new
  def new
    @ranking_points_entry = RankingPointsEntry.new
  end

  # GET /ranking_points_entries/1/edit
  def edit
  end

  # POST /ranking_points_entries
  # POST /ranking_points_entries.json
  def create
    @ranking_points_entry = RankingPointsEntry.new(ranking_points_entry_params)

    respond_to do |format|
      if @ranking_points_entry.save
        format.html { redirect_to @ranking_points_entry, notice: 'Ranking points entry was successfully created.' }
        format.json { render :show, status: :created, location: @ranking_points_entry }
      else
        format.html { render :new }
        format.json { render json: @ranking_points_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ranking_points_entries/1
  # PATCH/PUT /ranking_points_entries/1.json
  def update
    respond_to do |format|
      if @ranking_points_entry.update(ranking_points_entry_params)
        format.html { redirect_to @ranking_points_entry, notice: 'Ranking points entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @ranking_points_entry }
      else
        format.html { render :edit }
        format.json { render json: @ranking_points_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ranking_points_entries/1
  # DELETE /ranking_points_entries/1.json
  def destroy
    @ranking_points_entry.destroy
    respond_to do |format|
      format.html { redirect_to ranking_points_entries_url, notice: 'Ranking points entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ranking_points_entry
      @ranking_points_entry = RankingPointsEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ranking_points_entry_params
      params.require(:ranking_points_entry).permit(:expire_on, :total_points, :player_id)
    end
end
