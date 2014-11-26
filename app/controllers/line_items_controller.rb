class LineItemsController < ApplicationController

  def new
    @items    = Item.all
    @meats    = find_food_group('meat')
    @veggies  = find_food_group('veggies')
    @extras   = find_food_group('extras')
    @salsas   = find_food_group('salsas')
  end

  private

  def find_food_group(food_group)
    Filling.where(food_group: food_group)
  end

end
