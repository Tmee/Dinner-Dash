class Admin::OrdersController < Admin::BaseAdminController


  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items
  end

  def update

  end

  def status_filter
    @orders = Order.where(:state => params[:state])
      respond_to do |format|
        format.js
    end
  end

end
