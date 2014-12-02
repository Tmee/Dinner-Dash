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
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
        redirect_to admin_order_path(@order), notice: "You have updated the order."
    else
      flash.now[:alert] = "The order was not updated. Please try again."
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :state)
  end
end
