class HomeController < ApplicationController
  before_action :authenticate, only: :index
  def guest

  end
end

