class HomeController < ApplicationController
  layout "application"

  def index
    @items = Item.all.sort
  end

end
