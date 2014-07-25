class HomeCourtsController < ApplicationController
  def new
    @home_court = HomeCourt.new    
  end
 
  def create
    HomeCourt.create home_court_params
  end
  private

  def home_court_params
    params.require(:home_court).permit(:name, :location_id)
  end
end
