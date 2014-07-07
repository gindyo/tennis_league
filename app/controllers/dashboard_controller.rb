class DashboardController < ApplicationController
 #
  #before_action :authenticate

  def index
     @user = current_user  
  end
end
