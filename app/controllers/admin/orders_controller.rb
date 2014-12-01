class Admin::OrdersController < Admin::BaseAdminController
  layout 'admin'

  def index
    @orders = Order.all
    @states = ['paid','completed','canceled','ordered']
  end

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items
  end

  def update

  end
end
