class LineItemsController < ApplicationController

  def index
    @items    = Item.all
    @meats    = find_food_group('meats')
    @veggies  = find_food_group('veggies')
    @extras   = find_food_group('extras')
    @salsas   = find_food_group('salsas')
  end


  def build_item
    @item  = Item.find(params[:id])
    @items = Item.all ##### -Do not know why, but it breaks on the Nav Bar if this is not in there
  end



  private


  def find_food_group(food_group)
    Filling.where(food_group: food_group)
  end

end
