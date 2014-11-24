class HomeController < ApplicationController
  def index
    def index
      @hermano_said = Hermano.say_that_cool_thing
      @items        = Item.all
      render layout: false
    end
  end
end
