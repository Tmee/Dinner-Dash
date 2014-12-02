class HomeController < ApplicationController
  layout "application"

  def index
    @hermano_said = Hermano.say_that_cool_thing
    @items        = Item.all.sort
  end

end
