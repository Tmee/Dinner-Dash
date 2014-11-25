class CartController < ApplicationController

  def index
    @cart = session[:cart]  
  end

  def create
    session[:cart] ||= {} 
    session[:cart][params[:item_id]] = params[:item][:filling_ids]
    redirect_to cart_path, notice: "User created. Please log in."
  end

  def update
  end

end
