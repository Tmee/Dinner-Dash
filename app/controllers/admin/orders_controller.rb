class Admin::OrdersController < Admin::BaseAdminController


  def index
    @orders = Orders.all
  end

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items
  end

  def update

  end

end
