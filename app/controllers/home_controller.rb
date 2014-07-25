class HomeController < ApplicationController
  before_action :authenticate, only: :index
  def guest

  end
  def index
    redirect_to :dashboard
  end
end

