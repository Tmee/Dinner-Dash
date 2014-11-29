class OrdersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_items

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items
  end

  def create
    @order = Order.create(user_id: session[:user_id])
    session[:cart].each do |line_item|
      item = @order.line_items.create(item_id: line_item["item_id"], quantity: line_item["quantity"])
      item.filling_ids = line_item["filling_ids"]
    end
    if @order.save!
      session[:cart].clear
      redirect_to order_path(@order), notice: "Deliciousness is imminent!"
    else
      flash.now[:error] = "Order could not be placed. Error!"
      redirect_to cart_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :state)
  end
end
