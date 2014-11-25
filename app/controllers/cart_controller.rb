class CartController < ApplicationController

  def index
    @items = Item.all
    @cart = session[:cart] 
    @cart_items = Hash.new

    @cart.each_pair do |key, value|
      @cart_items[Item.find(key)] = value.map do |filling_id|
        Filling.find(filling_id)
      end
    end
  end

  def create
    session[:cart] ||= {} 
    session[:cart][params[:item_id]] = params[:item][:filling_ids]
    redirect_to cart_index_path, notice: "User created. Please log in."
  end

  def update
  end

end
