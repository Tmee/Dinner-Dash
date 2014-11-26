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
    @order = Order.new(order_params)

    if @order.save!
      redirect_to order_path(@order), notice: "Deliciousness is imminent!"
    else
      flash.now[:error] = "Order could not be placed. Error!"
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :state)
  end
end
