class CartController < ApplicationController

  def index
    @items = Item.all
    @cart = session[:cart]
    @cart_items = Hash.new
    get_cart_items
  end

  def get_cart_items
    if cart_nil
      @cart.each_pair do |key, value|
        @cart_items[Item.find(key)] = value.map do |filling_id|
          Filling.find(filling_id)
        end
      end
    else
      redirect_to root_path, notice: "Your cart is empty.  Please fill it up and give us money!"
    end
  end

  def cart_nil
    @cart.nil? == false
  end


  def create
    session[:cart] ||= {}
    session[:cart][params[:item_id]] = params[:item][:filling_ids]
    redirect_to cart_index_path, notice: "User created. Please log in."
  end

  def update
  end
end